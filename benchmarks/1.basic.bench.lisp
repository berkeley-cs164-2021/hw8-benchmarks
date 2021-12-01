(define (plus1 x p) (+ x p))
(define (plus2 x p1 p2) (plus1 x (plus1 p1 p2)))
(define (plus3 x p1 p2 p3) (plus1 x (plus2 p1 p2 p3)))
(define (plus4 x p1 p2 p3 p4) (plus1 x (plus3 p1 p2 p3 p4)))
(define (plus5 x p1 p2 p3 p4 p5) (plus1 x (plus4 p1 p2 p3 p4 p5)))
(define (plus6 x p1 p2 p3 p4 p5 p6) (plus1 x (plus5 p1 p2 p3 p4 p5 p6)))

(define (bench n)
    (if (< n 0)
        0
        (plus6 (bench (- n 1)) (plus1 n 1) (plus1 n 2) (plus1 n 3) (plus1 n 4) (plus1 n 5) (plus1 n 6))
    )
)
(define (bench-k-times k) (if (< k 0) 0 (do (bench 10000) (bench-k-times (- k 1)))))
(do 
(bench-k-times 1000)
(print (bench 10000))
) 
