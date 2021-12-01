(define (printForever msg)
    (do
        (print msg)
        (printForever msg)
    )
    )
(printForever 123)