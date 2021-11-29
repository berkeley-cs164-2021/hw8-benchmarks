(define (i n)
  1)

(define (h n)
  2)

(define (g n)
  4)

(define (pi n)
  314159)

(define (f n)
  (+ n
     (let ((n (h 1)))
       (let ((n2 true))
	 (let ((n3 false))
	   (let ((n4 42))
	     (let ((n5 (pi (h n4))))
	       (if (= n (+ (i 1) (i 1)))
		   (if (< (i 1) (+ (sub1 (sub1 (sub1 (add1 1)))) 1))
		       (if (= (i 1) 0) 2
			 (if n2 (if n3 n5 n4) 1))
		     n4)
		 n4))))))))


(let ((n (read-num)))
  (print
   (+
    (add1 (+ (f n) (f n)))
    (+ (add1 (+ (f n) (+ (f n) n))) (g n)))))


