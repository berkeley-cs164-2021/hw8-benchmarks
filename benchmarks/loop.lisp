(define (loop n i)
  (if (= i 0)
    n
    (loop n (sub1 i))
  )
)

(print (loop (read-num) 5000000))
