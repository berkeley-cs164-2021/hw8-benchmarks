(define (tj carts num)
    (let ((initialCarts 10))
        (let ((initialBaskets 20))
            (if (= carts true)
                (- initialCarts num)
                (- initialBaskets num)
            )
        )
    )
)

(print (- (do (tj true 3) (tj true 3) (tj false 1)) 19))
