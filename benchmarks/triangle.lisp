(define (triangle n) (if (= n 0) 0 (+ n (triangle (- n 1)))))
(do (triangle 12)
  (triangle 13)
  (triangle 14)
)
