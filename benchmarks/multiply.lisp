(define (* x y) (if (= y 0) 0 (+ x (* x (sub1 y)))))

(print (* 22 8))