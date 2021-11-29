(define (handshakes n) (if (= n 1) (+ 5 (- 0 5)) (+ (- n 1) (handshakes (- n 1)))))
(do
(print (handshakes 1))
(newline)
(print (handshakes 8))
(newline)
(print (handshakes 12))
)
