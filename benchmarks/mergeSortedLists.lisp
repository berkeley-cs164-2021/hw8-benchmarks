(define (lstRange start end step)
    (if (not (< start end))
        (pair start ())
        (pair start (lstRange (+ start step) end step))
    )
)

(define (mergeSorted lst1 lst2)
    (if (empty? lst1)
        lst2
        (if (empty? lst2)
            lst1
            (if (< (left lst1) (left lst2))
                (pair (left lst1) (mergeSorted (right lst1) lst2))
                (pair (left lst2) (mergeSorted lst1 (right lst2)))
            )
        )
    )
)

(print (mergeSorted (lstRange 0 98 2) (lstRange 1 99 2)))