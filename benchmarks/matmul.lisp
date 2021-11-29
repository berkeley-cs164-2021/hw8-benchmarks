(define (find-last-set-helper n cur b)
  (let ((cur2 (+ cur cur)))
    (if (< n cur2)
      b
      (find-last-set-helper n cur2 (add1 b)))))

(define (find-last-set n)
  (find-last-set-helper n 1 0))

(define (find-first-set n)
  (if (zero? n)
    0
    (let ((b (find-last-set n)))
      (let ((pow2 (lsl 1 b)))
        (if (= n pow2)
          b
          (find-first-set (- n pow2)))))))

(define (lsl a b)
  (if (zero? b)
    a
    (lsl (+ a a) (sub1 b))))

(define (mul-helper a b n acc)
  (if (zero? b)
    acc
    (let ((first-set (find-first-set b)))
      (if (= first-set n)
        (mul-helper (+ a a) (- b (lsl 1 first-set)) (add1 n) (+ acc a))
        (mul-helper (+ a a) b (add1 n) acc)))))

(define (mul a b)
  (mul-helper a b 0 0))

(define (matmul
          a00 a01 a02 a03
          a10 a11 a12 a13
          a20 a21 a22 a23
          a30 a31 a32 a33
          b00 b01 b02 b03
          b10 b11 b12 b13
          b20 b21 b22 b23
          b30 b31 b32 b33)
  (list-of-mat
    (+ (mul a00 b00) (+ (mul a01 b10) (+ (mul a02 b20) (mul a03 b30))))
    (+ (mul a00 b01) (+ (mul a01 b11) (+ (mul a02 b21) (mul a03 b31))))
    (+ (mul a00 b02) (+ (mul a01 b12) (+ (mul a02 b22) (mul a03 b32))))
    (+ (mul a00 b03) (+ (mul a01 b13) (+ (mul a02 b23) (mul a03 b33))))
    (+ (mul a10 b00) (+ (mul a11 b10) (+ (mul a12 b20) (mul a13 b30))))
    (+ (mul a10 b01) (+ (mul a11 b11) (+ (mul a12 b21) (mul a13 b31))))
    (+ (mul a10 b02) (+ (mul a11 b12) (+ (mul a12 b22) (mul a13 b32))))
    (+ (mul a10 b03) (+ (mul a11 b13) (+ (mul a12 b23) (mul a13 b33))))
    (+ (mul a20 b00) (+ (mul a21 b10) (+ (mul a22 b20) (mul a23 b30))))
    (+ (mul a20 b01) (+ (mul a21 b11) (+ (mul a22 b21) (mul a23 b31))))
    (+ (mul a20 b02) (+ (mul a21 b12) (+ (mul a22 b22) (mul a23 b32))))
    (+ (mul a20 b03) (+ (mul a21 b13) (+ (mul a22 b23) (mul a23 b33))))
    (+ (mul a30 b00) (+ (mul a31 b10) (+ (mul a32 b20) (mul a33 b30))))
    (+ (mul a30 b01) (+ (mul a31 b11) (+ (mul a32 b21) (mul a33 b31))))
    (+ (mul a30 b02) (+ (mul a31 b12) (+ (mul a32 b22) (mul a33 b32))))
    (+ (mul a30 b03) (+ (mul a31 b13) (+ (mul a32 b23) (mul a33 b33))))))

(define (list-of-mat
          a00 a01 a02 a03
          a10 a11 a12 a13
          a20 a21 a22 a23
          a30 a31 a32 a33)
  (pair a00 (pair a01 (pair a02 (pair a03 
        (pair a10 (pair a11 (pair a12 (pair a13
              (pair a20 (pair a21 (pair a22 (pair a23
                    (pair a30 (pair a31 (pair a32 (pair a33 ())))))))))))))))))

(do
  (print (mul 0 0))
  (print (mul 0 1))
  (print (mul 1 0))
  (print (mul 1 1))
  (print (mul 3 1))
  (print (mul 1 3))
  (print (mul 3 5))
  (print (mul 20 40))
  (print (matmul
           2 3 1 1
           1 2 3 1
           1 1 2 3
           3 1 1 2
           0 1 2 3
           4 5 6 7
           8 9 10 11
           12 13 14 15)))
