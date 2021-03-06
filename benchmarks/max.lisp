(define (max a b) (if (< a b) b a))
(define (times a b) (timeshelper a b 0))
(define (timeshelper i b total) (if (= 0 i) total (timeshelper (- i 1) b (+ total b))))
(define (factorial n) (if (= 0 n) 1 (times n (factorial (- n 1)))))
(define (fib n) (if (= n 0) 0 (if (= n 1) 1 (+ (fib (- n 2)) (fib (- n 1))))))
(print (let ((x (read-num))) (max (fib x) (factorial x))))