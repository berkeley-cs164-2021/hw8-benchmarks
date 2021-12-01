(define (g x y) (multog x y))
(define (multog num1 num2) (+ num1 num2))
(print (g (read-num) (read-num)))