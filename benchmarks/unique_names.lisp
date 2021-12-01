(define (a x y z) (- z (+ x y)))
(define (b x y z) (+ x (- z y)))
(define (c x y z) (+ z (- y x)))
(print (a 1 (b 4 6 1) (c 2 9 5)))