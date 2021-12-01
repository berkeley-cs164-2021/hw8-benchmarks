(define (count x y)
   (if (= x y) y
        (count (+ x 1) y)))

(count 3 90)