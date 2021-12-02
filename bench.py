#!/usr/bin/env python3

import argparse
import csv
from dataclasses import dataclass
import glob
import json
import multiprocessing
import os
import re
import subprocess
import sys
import time
from typing import Dict, Iterable, List, Optional, Tuple

N = 10
BENCHMARKS_DIR = 'benchmarks'
OUTPUT_DIR = 'compiled_benchmarks'

DOT_LISP_RE = re.compile(r'\.lisp$')

@dataclass(frozen=True)
class Benchmark:
    source_path: str
    input_path: Optional[str]

def passes_to_str(passes: Iterable[str]):
    ret = '--'.join(passes)
    if ret == '':
        ret = 'unoptimized'
    return ret

def compile_compiler() -> None:
    subprocess.run(('dune', 'build', 'bin/compile.exe'), cwd='..', check=True)

def compile_benchmark(passes: List[str], benchmark: Benchmark) -> str:
    passes_args: List[str] = []
    for p in passes:
        passes_args.extend(('-p', p))

    output_dir = os.path.join(OUTPUT_DIR,
                              passes_to_str(passes),
                              DOT_LISP_RE.sub('', os.path.basename(benchmark.source_path)))
    os.makedirs(output_dir, exist_ok=True)
    try:
        subprocess.run(
            ('../_build/default/bin/compile.exe',
             *passes_args,
             benchmark.source_path,
             output_dir),
            check=True,
        )
    except subprocess.CalledProcessError:
        print(f'Error compiling {os.path.basename(benchmark.source_path)} with optimizations {passes}', file=sys.stderr)
    return os.path.join(output_dir, f'{os.path.basename(benchmark.source_path)}.exe')

def bench(passes_list: Iterable[Tuple[str, ...]], benchmarks: Iterable[Benchmark]) -> Dict[Tuple[str, ...], Dict[Benchmark, float]]:
    dirname = os.path.dirname(__file__)

    passes_benchmarks = [(passes, benchmark) for benchmark in benchmarks for passes in passes_list]

    # First, compile all benchmarks.
    with multiprocessing.Pool() as pool:
        benchmark_exes = pool.starmap(compile_benchmark, passes_benchmarks)

    # Then, run each benchmark N times and record the results
    results: Dict[Tuple[str, ...], Dict[Benchmark, float]] = {}
    for (passes, benchmark), benchmark_exe in zip(passes_benchmarks, benchmark_exes):
        runs: List[float] = []
        for i in range(N):
            print(benchmark.source_path)
            if benchmark.input_path is not None:
                with open(benchmark.input_path) as infile:
                    start = time.perf_counter()
                    subprocess.run(
                            benchmark_exe,
                            stdin=infile,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            check=True)
                    end = time.perf_counter()
            else:
                start = time.perf_counter()
                subprocess.run(
                        benchmark_exe,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        check=True)
                end = time.perf_counter()
            runs.append(end - start)
        results.setdefault(passes, {})[benchmark] = sum(runs) / len(runs)
    return results


def main() -> int:
    parser = argparse.ArgumentParser(
        description="CS 164 Homework 8 Benchmark Script"
    )
    parser.add_argument("--config", type=argparse.FileType("r"), default="config.json")
    parser.add_argument("--output", type=argparse.FileType("w"), default="results.csv")
    args = parser.parse_args()
    try:
        config: Dict[str, List[str]] = json.load(args.config)
    except json.decoder.JSONDecodeError as e:
        print("Error reading config file {}: {}".format(args.config.name, e))
        return 1

    passes_to_name = {tuple(passes): name for name, passes in config.items()}

    compile_compiler()

    benchmark_paths = glob.glob(os.path.join(os.path.dirname(__file__), BENCHMARKS_DIR, '*.lisp'))
    benchmarks: List[Benchmark] = []
    for benchmark_path in benchmark_paths:
        input_path = DOT_LISP_RE.sub('.in', benchmark_path)
        benchmarks.append(Benchmark(benchmark_path, input_path if os.path.exists(input_path) else None))
    results = bench(passes_to_name.keys(), benchmarks)

    writer = csv.writer(args.output)
    writer.writerow(("Benchmark name", "Configuration", "Time taken (s)"))
    for passes, benchmark_results in results.items():
        config_name = passes_to_name[passes]
        for benchmark, time in benchmark_results.items():
            writer.writerow((os.path.basename(benchmark.source_path), config_name, time))

    return 0


if __name__ == '__main__':
    exit(main())
