(define (mulhelper m n acc)
  (if (= n 0)
    acc
    (mulhelper m (sub1 n) (+ acc m))
  )
)

(define (mul m n)
  (mulhelper m n 0)
)

(print (mul (read-num) (read-num)))
