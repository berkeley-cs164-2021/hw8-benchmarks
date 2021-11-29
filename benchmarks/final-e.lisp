(define (f x y z) (plus x (plus (add1 y) z)))

(let ((x 3)) (let ((y 8)) (let ((z 21)) (print (f x y z)))))