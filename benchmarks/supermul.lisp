(define (helper m n total)
  (if (= n 0)
    total
    (helper m (sub1 n) (+ total m))
  )
)

(define (mul m n)
  (helper m n 0)
)

(define (supermul m n)
	(if (= n 0)
    m
    (supermul (mul m n) (sub1 n))
  )
)

(print (supermul 100 100))