(define (mulhelper m n total)
  	(if (= n 0)	
  		total
		(mulhelper m (sub1 n) (+ total m))
	)
)

(define (mul m n)
	(mulhelper m n 0)
)

(define (mullisthelper lst total)
	(if (empty? lst)
		total
		(mullisthelper (right lst) (mul total (left lst)))
	)
)

(define (mullist lst)
	(mullisthelper lst 1)
)

(print (mullist (pair 1 (pair 2421 (pair 43 (pair 5 (pair 14132 ())))))))