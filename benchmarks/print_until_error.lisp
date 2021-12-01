(define (printUntilError curr max)
    (if (= curr max)
        (+ 1 (read-num))
        (do
            (print curr)
            (printUntilError (+ curr 1) max)
        )))
(printUntilError 0 10000000)