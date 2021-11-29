(define (huge x) (if (< x 2) x (+ x (huge (sub1 x)))))
(print (if (< 2 4) (add1 3) (huge 65535)))