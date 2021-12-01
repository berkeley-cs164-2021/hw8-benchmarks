(define (* x y) (if (= y 0) 0 (+ x (* x (sub1 y)))))

(define (mod n d) (if (< n d) n (mod (- n d) d)))

(print (mod 10 3))
