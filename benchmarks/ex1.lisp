(define (f x y) (if false (let ((x 8)) (pair 10 9)) (let ((y 0)) (pair x (pair y 10)))))

(let ((x 19))
  (let ((y 32))
    (print (f y x))))
