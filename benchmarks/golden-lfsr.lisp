(define (lsl1 x) 
	(+ x x)
)

(define (lsl x n) 
	(if (zero? n)
		x
		(lsl (lsl1 x) (sub1 n)) 
	)
)

(define (idiv-positive-helper a b ctr)
    (if (zero? a)
        ctr
        (if (< a b)
			ctr
            (idiv-positive-helper (- a b) b (add1 ctr))
        )
    )
)

(define (idiv-positive a b)
    (idiv-positive-helper a b 0)
)

(define (lsr x n)
    (let ((divisor (lsl 1 n)))
        (idiv-positive x divisor)
    )
)

(define (bit-extract x i)
    (let ((a (lsr x i)))
        (let ((b (lsr x (add1 i))))
            (let ((c (lsl1 b)))
                (- a c)
            )
        )
    )
)

(define (lxor1 a b)
    (if (zero? a)
        b
        (if (zero? b)
            1
            0
        )
    )
)

(define (lfsr4-step bits)
    (let ((b0 (bit-extract bits 3)))
        (let ((b1 (lxor1 (bit-extract bits 0) (bit-extract bits 3))))
            (let ((b2 (bit-extract bits 1)))
                (let ((b3 (bit-extract bits 2)))
                    (+ (+ (+ b0 (lsl b1 1)) (lsl b2 2)) (lsl b3 3))
                )
            )
        )
    )
)

(define (lfsr4-test bits count)
    (if (zero? count)
        (newline)
        (let ((new-state (lfsr4-step bits)))
            (do
                (print bits)
                (newline)
                (lfsr4-test new-state (sub1 count))
            )
        )
    )
)

(do
    (print (bit-extract 6666166 5))
    (newline)
    (print (bit-extract (read-num) 6))
    (newline)
    (print (bit-extract 6666166 7))
    (newline)
    (newline)

    (print (lxor1 0 0))
    (newline)
    (print (lxor1 1 0))
    (newline)
    (print (lxor1 0 1))
    (newline)
    (print (lxor1 1 1))
    (newline)
    (newline)

    (print (lfsr4-test (read-num) 16))
)
