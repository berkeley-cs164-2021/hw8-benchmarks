(define (* x y) (if (= y 0) 0 (+ x (* x (sub1 y)))))
(define (fact n) (if (= n 0) 1 (if (= n 1) 1 (* n (fact (sub1 n))))))

(print (fact 9))