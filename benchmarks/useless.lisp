(define (loop n i)
  (if (= i 0)
    n
    (loop
      (loop n (sub1 i))
      (sub1 i)
    )
  )
)

(print (loop (read-num) 24))
