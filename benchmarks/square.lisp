(define (square n) (squarehelper n 0 n))
(define (squarehelper n total i) (if (= i 0) total (squarehelper n (+ total n) (- i 1))))
(print (square 5))