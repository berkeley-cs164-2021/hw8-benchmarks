(define (even n) (if (< n 2) (if (= n 0) true false) (even (- n 2))))
(print (even 247))