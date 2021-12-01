(define (f args) (if (empty? args) (- 2 0) (pair (+ 1 1) (if true args (+ 9 10))))) 
(define (g a b) (+ (add1 a) b)) 
(let ((x 1)) (print (f (pair (g x 1) (g x 1)))))
