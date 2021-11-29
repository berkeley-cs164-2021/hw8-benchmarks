(define (pow2 n)
  (if (= n 0)
    1
    (+ (pow2 (sub1 n)) (pow2 (sub1 n)))
  )
)

(print (pow2 (read-num)))
