(define (expr1 x) (+ 1 (+ 200 100)))
(define (expr2 y) (do (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y) (expr1 y)))
(define (expr3 z) (do (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z) (expr2 z)))
(define (expr4 k) (do (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) (expr3 k) ))

(print (do (expr4 1) (expr4 2) (expr4 3) (expr4 4) (expr4 5) (expr4 6) (expr4 7) (expr4 8) (expr4 9)))
