(define (fib n) (if (= n 1) 1 (if (= n 0) 0 (+ (fib (sub1 n)) (fib (- n 2))))))

(print (fib 15))