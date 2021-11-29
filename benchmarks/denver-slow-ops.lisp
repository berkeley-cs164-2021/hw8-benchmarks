(define (mul-helper x y sum) 
	(if (= x 0) 
		sum
		(if (= y 0)
			sum
			(mul-helper x (sub1 y) (+ sum x))
		)
	) 
)

(define (mul-positive x y) (mul-helper x y 0))

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

(define (perf-mul-assert x y answer rounds)
	(if (zero? rounds)
		true
		(if (not (= (mul-positive x y) answer))
			false
			(perf-mul-assert x y answer (sub1 rounds))
		)
	)
)

(define (perf-lsl-assert x n answer rounds)
	(if (zero? rounds)
		true
		(if (not (= (lsl x n) answer))
			false
			(perf-lsl-assert x n answer (sub1 rounds))
		)
	)
)

(define (if-you-crash-here-you-need-to-tco-your-optimizers-sorry-lol)
	(idiv-positive 4276545 1)
)

(do 
	(print (mul-positive (read-num) (read-num)))
	(newline)
	(print (mul-positive 4 3))
	(newline)
	(print (mul-positive 1 5))
	(newline)
	(print (mul-positive 5 1))
	(newline)
	(print (mul-positive 0 5))
	(newline)
	(print (mul-positive 5 0))
	(newline)
	(newline)

	(print (idiv-positive 12 6))
	(newline)
	(print (idiv-positive 13 6))
	(newline)
	(print (idiv-positive 24 6))
	(newline)
	(print (idiv-positive 1 6))
	(newline)
	(print (if-you-crash-here-you-need-to-tco-your-optimizers-sorry-lol))
	(newline)
	(print (idiv-positive (read-num) (read-num)))
	(newline)
	(newline)

	(print (lsl 4 2))
	(newline)
	(print (lsl 1 10))
	(newline)
	(print (lsl 10 0))
	(newline)
	(print (sub1 (lsl (read-num) (read-num))))
	(newline)
	(newline)

	(print (lsr 16 2))
	(newline)
	(print (lsr 43 2))
	(newline)
	(print (lsr 43 3))
	(newline)
	(print (lsr 43 4))
	(newline)
	(print (lsr 43 5))
	(newline)
	(print (lsr (read-num) (read-num)))
	(newline)
	(newline)

	(print (perf-mul-assert (read-num) (read-num) 132 5000))
	(newline)
	(print (perf-lsl-assert (read-num) (read-num) 4294967296 5000))
)
