(define (hotpockets cheese)
    (if (= cheese true) 
        (add1 (sub1 (add1 (sub1 1))))
        (+ 1 (+ 1 (- 1 0)))
    )
)

(print (+ (hotpockets true) (+ (hotpockets false) (hotpockets true))))
