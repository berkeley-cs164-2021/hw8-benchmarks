(define (c n) (if (= n 0) 5 (do (+ 1 (- 2 (+ 2 11))) (c (- n 1)))))
(print (c 100))