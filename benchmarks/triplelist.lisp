(define (mulhelper m n total)
  	(if (= n 0)	
  		total
		(mulhelper m (sub1 n) (+ total m))
	)
)

(define (mul m n)
	(mulhelper m n 0)
)

(define (triplelisthelper ilst olst)
	(if (empty? ilst)
		olst
		(triplelisthelper (right ilst) (pair (mul 3 (left ilst)) olst))
	)
)

(define (triplelist lst)
	(triplelisthelper lst ())
)

(print (triplelist (pair 1 (pair 2421 (pair 43 (pair 5 (pair 14132 ())))))))