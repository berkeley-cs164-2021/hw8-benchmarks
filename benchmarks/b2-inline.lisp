(define (f a b) (+ (+ a (add1 a)) (+ b (add1 b)))) (define (g c d) (+ (f (- c d) (- d c)) (f (- c d) (- d c)))) (define (h l m n o) (+ (g l m) (g n o))) (print (h 1 2 3 4))