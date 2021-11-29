(define (repeat n)
   (if (= n 0) 0 (do 
    (let ((x (+ 2 (- (+ 3 5) (+ (+ 4 6) (- 4 (+ 5 8)))))))
     (if (= x 0) x (+ x 6)))
    (repeat (- n 1)))))

(define (foo)
   (if (< 0 3) 
    (let ((x (- (+ 3 5) (+ (+ 4 6) 8))))
     (+ x 6)) (foo)))
   
(define (foo1)
   (if (< 3 0) 
    (let ((x (- (+ 3 5) (+ (+ 4 6) 8))))
     (+ x 6)) (foo1)))
   

(define (repeat1 n)
   (if (= n 0) 0 (do 
    (let ((y 2))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
        (let ((y (+ y y)))
             (+ (repeat y) 6))))))))))))
    (repeat1 (- n 1)))))

(repeat1 1000)
 
