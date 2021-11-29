(define (find-last-set-helper n cur b)
  (let ((cur2 (+ cur cur)))
    (if (< n cur2)
      b
      (find-last-set-helper n cur2 (add1 b)))))

(define (find-last-set n)
  (find-last-set-helper n 1 0))

(define (lsl a b)
  (if (zero? b)
    a
    (lsl (+ a a) (sub1 b))))

(define (lsr-tail a b acc)
  (let ((abit (find-last-set a)))
    (if (< abit b)
      acc
      (let ((apow2 (lsl 1 abit)))
        (lsr-tail (- a apow2) b (+ acc (lsl 1 (- abit b))))))))

(define (lsr a b)
  (if (zero? b)
    a
    (lsr-tail a b 0)))

(do
  (print (lsl 0 0))
  (print (lsl 1 0))
  (print (lsl 2 1))
  (print (lsl 2 2))
  (print (lsl 5 3))
  (print (lsr 0 0))
  (print (lsr 1 0))
  (print (lsr 2 1))
  (print (lsr 511 2))
  (print (lsr 1536 4)))
