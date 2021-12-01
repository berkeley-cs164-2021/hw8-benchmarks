(define (f a c) (if (< 3 4) (pair a (pair (+ 2 2) (pair a c))) (pair a c)))
(let ((x 10)) (let ((y 7)) (print (pair (+ x y) (pair (+ x y) (f (+ x y) 1))))))
