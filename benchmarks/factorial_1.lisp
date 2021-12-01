(define (* x y) (if (= y 0) 0 (+ x (* x (sub1 y)))))

(define (factorial n) (if (< n 0) 1 (* n (factorial (- n 1)))))

(print (factorial 5))