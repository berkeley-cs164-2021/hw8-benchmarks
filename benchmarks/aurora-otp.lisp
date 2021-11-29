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

(define (lxor a b len)
    (if (zero? len)
        0
        (+ 
            (lxor1 (bit-extract a 0) (bit-extract b 0))
            (lsl1 (lxor (lsr a 1) (lsr b 1) (sub1 len)))
        )
    )
)


(define (min a b)
    (if (< a b)
        a
        b
    )
)

(define (otp-encrypt m m-len k k-len)
    (lxor m k (min m-len k-len))
)

(define (encrypt-loop)
    (let ((k (read-num)))
        (if (zero? k)
            true
            (let ((m (read-num)))
                (do
                    (print (otp-encrypt m 16 k 16))
                    (newline)
                    (encrypt-loop)
                )
            )
        )
    )
)

(do
    (print (otp-encrypt 128 8 16705 16))
    (newline)
    (print (otp-encrypt 193 8 16705 16))
    (newline)
    (print (encrypt-loop))
)