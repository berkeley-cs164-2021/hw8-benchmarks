(define (loop n i)
  (if (= i 0)
    n
    (loop n (sub1 i))
  )
)

(print (loop 3 333333))