(define (tower n) (if (= n 1) (+ 0 0) (do (tower (- n 1)) (tower (- n 1))))) (tower 10)