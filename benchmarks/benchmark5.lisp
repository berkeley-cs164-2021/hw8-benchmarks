(define (f a b c d)
    (let ((a (+ a 2))) (+ a (+ b (+ c d)))))

(define (g a b c d)
    (f (+ a b) (+ c d) (+ a c) (+ b d)))

(print (+ (g 2 3 4 5) (g 9 8 7 6)))