(define (f x) (add1 x))
(print (pair (f 1) (pair (f 2) (pair (f 3) ()))))