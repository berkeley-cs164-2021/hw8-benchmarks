(define (mul-to x)
    (if (= x 1) 1
        (+ x (mul-to (sub1 x)))
    )
)
(let 
    ((x (read-num)))
    (- (mul-to x) (mul-to x))
)