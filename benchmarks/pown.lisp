(define (* x y) (if (= y 0) 0 (+ x (* x (sub1 y)))))

(define (pown n)
  (if (= n 0)
    1
    (* (pown (sub1 n)) n)
  )
)

(print (pown 3))
