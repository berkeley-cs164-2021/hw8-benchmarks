(define (cf1 x) (- 8 (add1 x)))
(define (cf2 x) (+ 8 (sub1 x)))
(print (let ((x 5)) (if (< x 7) (- (+ 2 (- (+ 3 (- (cf1 (read-num)) (cf2 (read-num)))) 3)) 2) x ) ) )