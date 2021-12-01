(define (f x y) (- (add1 x) y))
(define (g x) (f x 5))
(define (h y) (g y))

(do
  (print (h 10))
  (print (h 100))
  (print (h 1000))
)