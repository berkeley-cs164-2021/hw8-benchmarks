(define (f0 x y) (+ x (+ 40 y)))
(define (f1 a b) (- 270 (+ a (+ 16 b))))
(define (f3 e) (+ e (+ e (+ e (+ e 0)))))
(print (f0 (f1 2 70) (f0 (f3 12) 110)))