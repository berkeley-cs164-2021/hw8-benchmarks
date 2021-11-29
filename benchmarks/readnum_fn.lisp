(define (f x y) (+ (+ (+ x y) (read-num)) (+ 3 4)))

(let ((a 3)) 
    (let ((b 4))
        (f a b)))