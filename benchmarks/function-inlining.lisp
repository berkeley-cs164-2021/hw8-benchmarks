(define (f a b c) (+ a (- b c)))

(let ((a 10)) (let ((b 5)) (let ((c a)) (let ((a b)) (print (f a b c))))))
