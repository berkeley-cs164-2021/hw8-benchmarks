(define (lstRange start end)
    (if (= start end)
        (pair start ())
        (pair start (lstRange (add1 start) end))
    )
)

(define (findNum lst num)
    (if (empty? lst)
        -1
        (if (= (left lst) num)
            0
            (let ((x (findNum (right lst) num)))
                (if (= x -1)
                    -1
                    (add1 x)
                )    
            )
        )
    )
)

(define (twoSum lst num)
    (let ((x (findNum (right lst) (- num (left lst)))))
        (if (not (= x -1))
            (pair 0 (add1 x))
            (let ((p (twoSum (right lst) num)))
                (pair (add1 (left p)) (add1 (right p)))
            )    
        )
    )
)

(print (twoSum (lstRange 0 100) 199))