(define (find-last-set-helper n cur b)
  (let ((cur2 (+ cur cur)))
    (if (< n cur2)
      b
      (find-last-set-helper n cur2 (add1 b)))))

(define (find-last-set n)
  (find-last-set-helper n 1 0))

(define (find-left-set n)
  (if (zero? n)
    0
    (let ((b (find-last-set n)))
      (let ((pow2 (lsl 1 b)))
        (if (= n pow2)
          b
          (find-left-set (- n pow2)))))))

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

(define (land-tail a b acc)
  (if (zero? a)
    acc
    (if (zero? b)
      acc
      (let ((abit (find-last-set a)))
        (let ((apow2 (lsl 1 abit)))
          (let ((bbit (find-last-set b)))
            (let ((bpow2 (lsl 1 bbit)))
              (if (= abit bbit)
                (land-tail (- a apow2) (- b bpow2) (+ acc apow2))
                (if (< abit bbit)
                  (land-tail a (- b bpow2) acc)
                  (land-tail (- a apow2) b acc))))))))))

(define (land a b)
  (land-tail a b 0))

(define (lxor-tail a b acc)
  (if (zero? a)
    (+ b acc)
    (if (zero? b)
      (+ a acc)
      (let ((abit (find-last-set a)))
        (let ((apow2 (lsl 1 abit)))
          (let ((bbit (find-last-set b)))
            (let ((bpow2 (lsl 1 bbit)))
              (if (= abit bbit)
                (lxor-tail (- a apow2) (- b bpow2) acc)
                (if (< abit bbit)
                  (lxor-tail a (- b bpow2) (+ acc bpow2))
                  (lxor-tail (- a apow2) b (+ acc apow2)))))))))))

(define (lxor a b)
  (lxor-tail a b 0))

(define (aes-subbyte b)
  (let ((upper (lsr b 4)))
    (let ((lower (- b (lsl upper 4))))
      (if (= upper 0)
        (if (= lower 0) 99 (if (= lower 1) 124 (if (= lower 2) 119 (if (= lower 3) 123 (if (= lower 4) 242 (if (= lower 5) 107 (if (= lower 6) 111 (if (= lower 7) 197 (if (= lower 8) 48 (if (= lower 9) 1 (if (= lower 10) 103 (if (= lower 11) 43 (if (= lower 12) 254 (if (= lower 13) 215 (if (= lower 14) 171 118)))))))))))))))
        (if (= upper 1)
          (if (= lower 0) 202 (if (= lower 1) 130 (if (= lower 2) 201 (if (= lower 3) 125 (if (= lower 4) 250 (if (= lower 5) 89 (if (= lower 6) 71 (if (= lower 7) 240 (if (= lower 8) 173 (if (= lower 9) 212 (if (= lower 10) 162 (if (= lower 11) 175 (if (= lower 12) 156 (if (= lower 13) 164 (if (= lower 14) 114 192)))))))))))))))
          (if (= upper 2)
            (if (= lower 0) 183 (if (= lower 1) 253 (if (= lower 2) 147 (if (= lower 3) 38 (if (= lower 4) 54 (if (= lower 5) 63 (if (= lower 6) 247 (if (= lower 7) 204 (if (= lower 8) 52 (if (= lower 9) 165 (if (= lower 10) 229 (if (= lower 11) 241 (if (= lower 12) 113 (if (= lower 13) 216 (if (= lower 14) 49 21)))))))))))))))
            (if (= upper 3)
              (if (= lower 0) 4 (if (= lower 1) 199 (if (= lower 2) 35 (if (= lower 3) 195 (if (= lower 4) 24 (if (= lower 5) 150 (if (= lower 6) 5 (if (= lower 7) 154 (if (= lower 8) 7 (if (= lower 9) 18 (if (= lower 10) 128 (if (= lower 11) 226 (if (= lower 12) 235 (if (= lower 13) 39 (if (= lower 14) 178 117)))))))))))))))
              (if (= upper 4)
                (if (= lower 0) 9 (if (= lower 1) 131 (if (= lower 2) 44 (if (= lower 3) 26 (if (= lower 4) 27 (if (= lower 5) 110 (if (= lower 6) 90 (if (= lower 7) 160 (if (= lower 8) 82 (if (= lower 9) 59 (if (= lower 10) 214 (if (= lower 11) 179 (if (= lower 12) 41 (if (= lower 13) 227 (if (= lower 14) 47 132)))))))))))))))
                (if (= upper 5)
                  (if (= lower 0) 83 (if (= lower 1) 209 (if (= lower 2) 0 (if (= lower 3) 237 (if (= lower 4) 32 (if (= lower 5) 252 (if (= lower 6) 177 (if (= lower 7) 91 (if (= lower 8) 106 (if (= lower 9) 203 (if (= lower 10) 190 (if (= lower 11) 57 (if (= lower 12) 74 (if (= lower 13) 76 (if (= lower 14) 88 207)))))))))))))))
                  (if (= upper 6)
                    (if (= lower 0) 208 (if (= lower 1) 239 (if (= lower 2) 170 (if (= lower 3) 251 (if (= lower 4) 67 (if (= lower 5) 77 (if (= lower 6) 51 (if (= lower 7) 133 (if (= lower 8) 69 (if (= lower 9) 249 (if (= lower 10) 2 (if (= lower 11) 127 (if (= lower 12) 80 (if (= lower 13) 60 (if (= lower 14) 159 168)))))))))))))))
                    (if (= upper 7)
                      (if (= lower 0) 81 (if (= lower 1) 163 (if (= lower 2) 64 (if (= lower 3) 143 (if (= lower 4) 146 (if (= lower 5) 157 (if (= lower 6) 56 (if (= lower 7) 245 (if (= lower 8) 188 (if (= lower 9) 182 (if (= lower 10) 218 (if (= lower 11) 33 (if (= lower 12) 16 (if (= lower 13) 255 (if (= lower 14) 243 210)))))))))))))))
                      (if (= upper 8)
                        (if (= lower 0) 205 (if (= lower 1) 12 (if (= lower 2) 19 (if (= lower 3) 236 (if (= lower 4) 95 (if (= lower 5) 151 (if (= lower 6) 68 (if (= lower 7) 23 (if (= lower 8) 196 (if (= lower 9) 167 (if (= lower 10) 126 (if (= lower 11) 61 (if (= lower 12) 100 (if (= lower 13) 93 (if (= lower 14) 25 115)))))))))))))))
                        (if (= upper 9)
                          (if (= lower 0) 96 (if (= lower 1) 129 (if (= lower 2) 79 (if (= lower 3) 220 (if (= lower 4) 34 (if (= lower 5) 42 (if (= lower 6) 144 (if (= lower 7) 136 (if (= lower 8) 70 (if (= lower 9) 238 (if (= lower 10) 184 (if (= lower 11) 20 (if (= lower 12) 222 (if (= lower 13) 94 (if (= lower 14) 11 219)))))))))))))))
                          (if (= upper 10)
                            (if (= lower 0) 224 (if (= lower 1) 50 (if (= lower 2) 58 (if (= lower 3) 10 (if (= lower 4) 73 (if (= lower 5) 6 (if (= lower 6) 36 (if (= lower 7) 92 (if (= lower 8) 194 (if (= lower 9) 211 (if (= lower 10) 172 (if (= lower 11) 98 (if (= lower 12) 145 (if (= lower 13) 149 (if (= lower 14) 228 121)))))))))))))))
                            (if (= upper 11)
                              (if (= lower 0) 231 (if (= lower 1) 200 (if (= lower 2) 55 (if (= lower 3) 109 (if (= lower 4) 141 (if (= lower 5) 213 (if (= lower 6) 78 (if (= lower 7) 169 (if (= lower 8) 108 (if (= lower 9) 86 (if (= lower 10) 244 (if (= lower 11) 234 (if (= lower 12) 101 (if (= lower 13) 122 (if (= lower 14) 174 8)))))))))))))))
                              (if (= upper 12)
                                (if (= lower 0) 186 (if (= lower 1) 120 (if (= lower 2) 37 (if (= lower 3) 46 (if (= lower 4) 28 (if (= lower 5) 166 (if (= lower 6) 180 (if (= lower 7) 198 (if (= lower 8) 232 (if (= lower 9) 221 (if (= lower 10) 116 (if (= lower 11) 31 (if (= lower 12) 75 (if (= lower 13) 189 (if (= lower 14) 139 138)))))))))))))))
                                (if (= upper 13)
                                  (if (= lower 0) 112 (if (= lower 1) 62 (if (= lower 2) 181 (if (= lower 3) 102 (if (= lower 4) 72 (if (= lower 5) 3 (if (= lower 6) 246 (if (= lower 7) 14 (if (= lower 8) 97 (if (= lower 9) 53 (if (= lower 10) 87 (if (= lower 11) 185 (if (= lower 12) 134 (if (= lower 13) 193 (if (= lower 14) 29 158)))))))))))))))
                                  (if (= upper 14)
                                    (if (= lower 0) 225 (if (= lower 1) 248 (if (= lower 2) 152 (if (= lower 3) 17 (if (= lower 4) 105 (if (= lower 5) 217 (if (= lower 6) 142 (if (= lower 7) 148 (if (= lower 8) 155 (if (= lower 9) 30 (if (= lower 10) 135 (if (= lower 11) 233 (if (= lower 12) 206 (if (= lower 13) 85 (if (= lower 14) 40 223)))))))))))))))
                                    (if (= lower 0) 140 (if (= lower 1) 161 (if (= lower 2) 137 (if (= lower 3) 13 (if (= lower 4) 191 (if (= lower 5) 230 (if (= lower 6) 66 (if (= lower 7) 104 (if (= lower 8) 65 (if (= lower 9) 153 (if (= lower 10) 45 (if (= lower 11) 15 (if (= lower 12) 176 (if (= lower 13) 84 (if (= lower 14) 187 22)))))))))))))))))))))))))))))))))

(define (aes-gfmul-helper a b n acc)
  (let ((modulus 283))
    (if (zero? b)
      acc
      (let ((left-set (find-first-set b)))
        (let ((a2 (+ a a)))
          (let ((a2mod (if (< a2 256) a2 (lxor a2 modulus))))
            (if (= left-set n)
              (aes-gfmul-helper a2mod (- b (lsl 1 left-set)) (add1 n) (lxor acc a))
              (aes-gfmul-helper a2mod b (add1 n) acc))))))))

(define (aes-gfmul a b)
  (aes-gfmul-helper a b 0 0))

(define (aes-keyschedule i
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (let ((imod4 (- i (lsl (lsr i 2) 2))))
    (if (zero? imod4)
      (let ((rc (aes-gfmul 1 (lsl 1 (lsr i 2)))))
        (+ (lsl (lxor k0 (lxor (aes-subbyte k13) rc)) 24)
           (+ (lsl (lxor k1 (aes-subbyte k14)) 16)
              (+ (lsl (lxor k2 (aes-subbyte k15)) 8)
                 (lxor k3 (aes-subbyte k12))))))
      (+ (lsl (lxor k0 k12) 24)
         (+ (lsl (lxor k1 k13) 16)
            (+ (lsl (lxor k2 k14) 8)
               (lxor k3 k15)))))))

(define (aes-subbytes i
          b0  b1  b2  b3
          b4  b5  b6  b7
          b8  b9  b10 b11
          b12 b13 b14 b15
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (aes-shiftrows i
    (aes-subbyte b0)  (aes-subbyte b1)  (aes-subbyte b2)  (aes-subbyte b3)
    (aes-subbyte b4)  (aes-subbyte b5)  (aes-subbyte b6)  (aes-subbyte b7)
    (aes-subbyte b8)  (aes-subbyte b9)  (aes-subbyte b10) (aes-subbyte b11)
    (aes-subbyte b12) (aes-subbyte b13) (aes-subbyte b14) (aes-subbyte b15)
    k0  k1  k2  k3
    k4  k5  k6  k7
    k8  k9  k10 k11
    k12 k13 k14 k15))

(define (aes-shiftrows i
          b0  b1  b2  b3
          b4  b5  b6  b7
          b8  b9  b10 b11
          b12 b13 b14 b15
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (if (= i 10)
    (aes-addroundkey i
      b0  b5  b10 b15
      b4  b9  b14 b3
      b8  b13 b2  b7
      b12 b1  b6  b11
      k0  k1  k2  k3
      k4  k5  k6  k7
      k8  k9  k10 k11
      k12 k13 k14 k15)
    (aes-mixcolumns i
      b0  b5  b10 b15
      b4  b9  b14 b3
      b8  b13 b2  b7
      b12 b1  b6  b11
      k0  k1  k2  k3
      k4  k5  k6  k7
      k8  k9  k10 k11
      k12 k13 k14 k15)))

(define (aes-mixcolumns i
          b0  b1  b2  b3
          b4  b5  b6  b7
          b8  b9  b10 b11
          b12 b13 b14 b15
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (aes-gfmatmul i
    2 3 1 1
    1 2 3 1
    1 1 2 3
    3 1 1 2
    b0 b4 b8  b12
    b1 b5 b9  b13
    b2 b6 b10 b14
    b3 b7 b11 b15
    k0  k1  k2  k3
    k4  k5  k6  k7
    k8  k9  k10 k11
    k12 k13 k14 k15))

(define (aes-gfmatmul i
          a00 a01 a02 a03
          a10 a11 a12 a13
          a20 a21 a22 a23
          a30 a31 a32 a33
          b00 b01 b02 b03
          b10 b11 b12 b13
          b20 b21 b22 b23
          b30 b31 b32 b33
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (aes-addroundkey i
    (lxor (aes-gfmul a00 b00) (lxor (aes-gfmul a01 b10) (lxor (aes-gfmul a02 b20) (aes-gfmul a03 b30))))
    (lxor (aes-gfmul a10 b00) (lxor (aes-gfmul a11 b10) (lxor (aes-gfmul a12 b20) (aes-gfmul a13 b30))))
    (lxor (aes-gfmul a20 b00) (lxor (aes-gfmul a21 b10) (lxor (aes-gfmul a22 b20) (aes-gfmul a23 b30))))
    (lxor (aes-gfmul a30 b00) (lxor (aes-gfmul a31 b10) (lxor (aes-gfmul a32 b20) (aes-gfmul a33 b30))))
    (lxor (aes-gfmul a00 b01) (lxor (aes-gfmul a01 b11) (lxor (aes-gfmul a02 b21) (aes-gfmul a03 b31))))
    (lxor (aes-gfmul a10 b01) (lxor (aes-gfmul a11 b11) (lxor (aes-gfmul a12 b21) (aes-gfmul a13 b31))))
    (lxor (aes-gfmul a20 b01) (lxor (aes-gfmul a21 b11) (lxor (aes-gfmul a22 b21) (aes-gfmul a23 b31))))
    (lxor (aes-gfmul a30 b01) (lxor (aes-gfmul a31 b11) (lxor (aes-gfmul a32 b21) (aes-gfmul a33 b31))))
    (lxor (aes-gfmul a00 b02) (lxor (aes-gfmul a01 b12) (lxor (aes-gfmul a02 b22) (aes-gfmul a03 b32))))
    (lxor (aes-gfmul a10 b02) (lxor (aes-gfmul a11 b12) (lxor (aes-gfmul a12 b22) (aes-gfmul a13 b32))))
    (lxor (aes-gfmul a20 b02) (lxor (aes-gfmul a21 b12) (lxor (aes-gfmul a22 b22) (aes-gfmul a23 b32))))
    (lxor (aes-gfmul a30 b02) (lxor (aes-gfmul a31 b12) (lxor (aes-gfmul a32 b22) (aes-gfmul a33 b32))))
    (lxor (aes-gfmul a00 b03) (lxor (aes-gfmul a01 b13) (lxor (aes-gfmul a02 b23) (aes-gfmul a03 b33))))
    (lxor (aes-gfmul a10 b03) (lxor (aes-gfmul a11 b13) (lxor (aes-gfmul a12 b23) (aes-gfmul a13 b33))))
    (lxor (aes-gfmul a20 b03) (lxor (aes-gfmul a21 b13) (lxor (aes-gfmul a22 b23) (aes-gfmul a23 b33))))
    (lxor (aes-gfmul a30 b03) (lxor (aes-gfmul a31 b13) (lxor (aes-gfmul a32 b23) (aes-gfmul a33 b33))))
    k0  k1  k2  k3
    k4  k5  k6  k7
    k8  k9  k10 k11
    k12 k13 k14 k15))

(define (aes-addroundkey i
          b0  b1  b2  b3
          b4  b5  b6  b7
          b8  b9  b10 b11
          b12 b13 b14 b15
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (if (= i 10)
    (list-of-mat
      (lxor b0 k0)   (lxor b1 k1)   (lxor b2 k2)   (lxor b3 k3)
      (lxor b4 k4)   (lxor b5 k5)   (lxor b6 k6)   (lxor b7 k7)
      (lxor b8 k8)   (lxor b9 k9)   (lxor b10 k10) (lxor b11 k11)
      (lxor b12 k12) (lxor b13 k13) (lxor b14 k14) (lxor b15 k15))
    (let ((k1619 (aes-keyschedule (lsl i 2)
                                  k0  k1  k2  k3
                                  k4  k5  k6  k7
                                  k8  k9  k10 k11
                                  k12 k13 k14 k15)))
      (let ((k16 (lsr k1619 24)))
        (let ((k17 (land (lsr k1619 16) 255)))
          (let ((k18 (land (lsr k1619 8) 255)))
            (let ((k19 (land k1619 255)))
              (let ((k2023 (aes-keyschedule (+ (lsl i 2) 1)
                                            k4  k5  k6  k7
                                            k8  k9  k10 k11
                                            k12 k13 k14 k15
                                            k16 k17 k18 k19)))
                (let ((k20 (lsr k2023 24)))
                  (let ((k21 (land (lsr k2023 16) 255)))
                    (let ((k22 (land (lsr k2023 8) 255)))
                      (let ((k23 (land k2023 255)))
                        (let ((k2427 (aes-keyschedule (+ (lsl i 2) 2)
                                                      k8  k9  k10 k11
                                                      k12 k13 k14 k15
                                                      k16 k17 k18 k19
                                                      k20 k21 k22 k23)))
                          (let ((k24 (lsr k2427 24)))
                            (let ((k25 (land (lsr k2427 16) 255)))
                              (let ((k26 (land (lsr k2427 8) 255)))
                                (let ((k27 (land k2427 255)))
                                  (let ((k2831 (aes-keyschedule (+ (lsl i 2) 3)
                                                                k12 k13 k14 k15
                                                                k16 k17 k18 k19
                                                                k20 k21 k22 k23
                                                                k24 k25 k26 k27)))
                                    (let ((k28 (lsr k2831 24)))
                                      (let ((k29 (land (lsr k2831 16) 255)))
                                        (let ((k30 (land (lsr k2831 8) 255)))
                                          (let ((k31 (land k2831 255)))
                                            (aes-subbytes (+ i 1)
                                              (lxor b0 k0)   (lxor b1 k1)   (lxor b2 k2)   (lxor b3 k3)
                                              (lxor b4 k4)   (lxor b5 k5)   (lxor b6 k6)   (lxor b7 k7)
                                              (lxor b8 k8)   (lxor b9 k9)   (lxor b10 k10) (lxor b11 k11)
                                              (lxor b12 k12) (lxor b13 k13) (lxor b14 k14) (lxor b15 k15)
                                              k16 k17 k18 k19
                                              k20 k21 k22 k23
                                              k24 k25 k26 k27
                                              k28 k29 k30 k31)))))))))))))))))))))))

(define (aes128
          b0  b1  b2  b3
          b4  b5  b6  b7
          b8  b9  b10 b11
          b12 b13 b14 b15
          k0  k1  k2  k3
          k4  k5  k6  k7
          k8  k9  k10 k11
          k12 k13 k14 k15)
  (aes-addroundkey 0
    b0  b1  b2  b3
    b4  b5  b6  b7
    b8  b9  b10 b11
    b12 b13 b14 b15
    k0  k1  k2  k3
    k4  k5  k6  k7
    k8  k9  k10 k11
    k12 k13 k14 k15))

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
  (print (aes128
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0))
  (print (aes128
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   1   2   3
             4   5   6   7
             8   9  10  11
            12  13  14  15))
  (print (aes128
             0  17  34  51
            68  85 102 119
           136 153 170 187
           204 221 238 255
             0   0   0   0
             0   0   0   0
             0   0   0   0
             0   0   0   0))
  (print (aes128
             0  17  34  51
            68  85 102 119
           136 153 170 187
           204 221 238 255
             0   1   2   3
             4   5   6   7
             8   9  10  11
            12  13  14  15)))
