(define (f x y) (- (+ y (add1 (- x (sub1 y)))) 2))
(print (let ((x 1)) (let ((y 2)) (f x y))))