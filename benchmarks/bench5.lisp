(define (f x) x)
(define (g x) (+ 1 x))
(print (let ((x 2)) (let ((x 1)) (do (let ((x 3)) (+ (f x) (+ (g x) (f x)))) x))))