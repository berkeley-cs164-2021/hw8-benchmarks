(define (fib x y z) (if (zero? x) y (fib (- x (- 58 (+ 2 (+ 9 (+ (+ 13 11) (+ 12 10)))))) (+ y z) y)))

(define (recomp x y z i) (if (zero? i) 0 (do (fib x y z) (fib x y z) (fib x y z) (fib x y z) (recomp x y z (- i 1)))))

(print (recomp 5000000 1 0 3))
