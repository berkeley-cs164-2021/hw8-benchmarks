(define (f x) (g x))
(define (g y) (h y))
(define (h z) (add1 z))
(print (f 10))
