(define (reverseList head)
    (if (empty? head)
        head
        (insertAtEnd (left head) (reverseList (right head))))
)

(define (insertAtEnd val lst)
    (if (empty? lst)
        (pair val ())
        (pair (left lst) (insertAtEnd val (right lst))))
)

(define (lstRange start end)
    (if (= start end)
        (pair start ())
        (pair start (lstRange (add1 start) end)))
)

(print (reverseList (lstRange 1 100)))