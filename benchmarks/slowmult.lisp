(define (slowadd a b)
    (if (= b 0)
        a
        (slowadd (add1 a) (sub1 b))
    )
)
(define (slowmult a b)
    (if (= b 1)
        a
        (slowadd a (slowmult a (sub1 b)))
    )
)

(print (slowmult 100 200))