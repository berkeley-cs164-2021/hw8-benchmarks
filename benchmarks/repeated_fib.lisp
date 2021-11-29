(define (f n)
  (- n 1))

(define (g n)
  (< n (- (fact 2) 1)))

(define (h n)
  (= n (sub1 (add1 (sub1 (add1 1))))))

(define (i n)
  (+ (+ n (fact 3)) (+ (+ n (fact 3)) (+ n (fact 3)))))

(define (fib n)
  (if (g n) 0
    (+
     (fib (f n))
     (fib (f (f n))))))

(define (fact n)
  (if (h n) 0
    (+ n (fact (f n)))))

(let ((n 6))
  (+ (+ (fact n) (fact n))
     (-
      (+ (fib n)
	 (+ (fib n) (fib n)))
      (fib (i n)))))
