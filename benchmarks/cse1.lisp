(define (mul x y) (if (< y 1) x (mul (+ x x) (sub1 y)))) 
(define (sq x) (mul x x))
(print (let 
        ((y (read-num))) 
        (let 
            ((x (read-num))) 
            (if 
                (< y x) 
                (- 
                    (+ (sq y) (sq x)) 
                    (- 
                        (+ 
                            (sq x) 
                            (- (+ (sq x) (sq y)) (mul 2 (mul x y)))
                        ) 
                        (sq y) 
                    )
                )
                (sq x)
            )
        ) 
    )
)