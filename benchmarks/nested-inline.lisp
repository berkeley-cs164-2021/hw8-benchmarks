(define (f x) (+ x 1))
(define (g x) (f (+ x 1)))
(print (let ((x 7)) (g (+ x 1))))