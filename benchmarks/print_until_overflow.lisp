(define (printUntilOverflow curr prev)
    (if (< curr prev)
        (print 123)
        (do
            (print curr)
            (printUntilOverflow (+ curr 1) curr)
        )))
(printUntilOverflow 1 0)