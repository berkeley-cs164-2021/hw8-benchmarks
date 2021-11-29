(define (even n)
  (evenhelper n true)
)

(define (evenhelper n acc)
  (if (= n 0)
    acc
    (evenhelper (sub1 n) (not acc))
  )
)

(define (div2 n)
  (div2helper n 0)
)

(define (div2helper n acc)
  (if (= (+ acc acc) n)
    acc
    (div2helper n (add1 acc))
  )
)
    
(define (threenplusone n)
  (add1 (+ (+ n n) n))
)

(define (collatz n i)
  (if (= n 1)
    i
    (if (even n)
      (collatz (div2 n) (add1 i))
      (collatz (threenplusone n) (add1 i))
    )
  )
)

(define (longest n sofar)
  (if (= n 1)
    sofar
    (let ((x (collatz n 1)))
      (let ((y (pair n x)))
        (if (< (right sofar) x)
          (longest (sub1 n) y)
          (longest (sub1 n) sofar)
        )
      ))
  )
)

(print (longest (read-num) (pair 1 1)))
