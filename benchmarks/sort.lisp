(define (rangehelper n i)
  (if (= n 0)
    ()
    (pair i (rangehelper (- n 1) (+ i 1)))))

(define (range n)
  (rangehelper n 0))

(define (reversehelper orig new)
  (if (empty? orig)
    new
    (reversehelper (right orig) (pair (left orig) new))))

(define (reverse l) (reversehelper l ()))

(define (sortedinsert l n)
  (if (empty? l)
    (pair n ())
    (if (< n (left l))
      (pair n l)
      (pair (left l) (sortedinsert (right l) n)))))

(define (sort l)
  (if (empty? l)
    ()
    (sortedinsert (sort (right l)) (left l))))

(print (left (sort (reverse (range (read-num))))))
