(define (acc n) (if (= n 0) 0 (+ n (acc (- n 1)))))
(print (acc 1000))
