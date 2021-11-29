(define (mod x n)
    (if (< x n)
        x
        (mod (- x n) n)
    )
)
(define (pow base exp)
    (if (= exp 0)
        1
        (mult base (pow base (- exp 1)))
    )
)
(define (mult a b)
    (if (= b 1)
        a
        (+ a (mult a (- b 1)))
    )
)
(define (defaultA) 149)
(define (defaultC) 661)
(define (defaultModulus) (pow 2 10))

(define (prng a c modulus seed)
    (mod (+ (mult a seed) seed) modulus)
)
(define (defaultPrng seed) (prng (defaultA) (defaultC) (defaultModulus) seed))

(define (llistOfRands listsofar n seed)
    (if (= n 0)
        listsofar
        (let ((nextseed (defaultPrng seed)))
            (llistOfRands
               (pair nextseed listsofar)
               (- n 1) nextseed
            )
        )
    )
)
(define (listOfRands n seed)
    (llistOfRands () n seed)
)

(define (last list)
    (if (empty? (right list))
        (left list)
        (last (right list))
    )
)

(let ((longlist (listOfRands 10 1)))
    (print (last longlist))
)