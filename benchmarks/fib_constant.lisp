(define (fib n) (
    if (= n 0) (add1 -1)
        (
            if (= n 1) (add1 0)
            (+ (fib (sub1 n)) (fib (- n 2)) )
        )
    )
)
(print (fib 37))