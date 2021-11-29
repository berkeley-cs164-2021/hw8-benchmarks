(define (twopower a) (if (= a 0) 1 (+ (twopower (sub1 a)) (twopower (sub1 a)))))
(twopower (read-num))
