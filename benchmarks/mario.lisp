(define (mario n) (if (< n 2) n (+ (mario (- n 1)) (mario (- n 2)))))
(do 
(print (mario 1))
(newline)
(print (mario 2))
(newline)
(print (mario 10))
)