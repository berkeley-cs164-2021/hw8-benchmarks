(define (f a) (+ a 2))
(define (g a) (f a))
(let ((a 2)) (print (g a)))
