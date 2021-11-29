(define (base x) 0)

(define (combiner x y)
  (+ x y))

(define (reduce x)
  (if (empty? x) (base x)
    (combiner (right x) (reduce (left x)))))

(define (filter x)
  (if (empty? x) ()
    (if (pred (right x))
	(pair (right x) (filter (left x)))
        (filter (left x)))))

(define (map x)
  (if (empty? x) () (pair (f (left x)) (map (right x)))))

(define (f x)
  (+ x 1))

(define (pred x)
  (= x 2))

(let ((y (pair 1 (pair 2 (pair 3 (pair 4 (pair 5 (pair 6 (pair 42 ())))))))))
  (let ((x (filter y)))
    (let ((y (map x)))
      (reduce y))))
