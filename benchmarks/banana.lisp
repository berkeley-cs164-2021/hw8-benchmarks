(define (fish eat food) (+ eat (- (+ eat food) (- eat (+ eat food)))))
(print (fish 10 20))