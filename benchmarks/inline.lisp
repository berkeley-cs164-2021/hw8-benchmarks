(define (add a b) 
     (+ a b))

(define (inc a) (add a 1))
(define (zero) (inc 0))
(define (one) (inc (zero)))
(define (two) (inc (one)))

(two)

 
