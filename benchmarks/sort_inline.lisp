(define (sorted-insert n xs) (
    if (empty? xs) 
    (pair n ()) 
    (if (< (left xs) n) 
        (pair (left xs) (sorted-insert n (right xs)))
        (pair n xs) 
    )
)
)

(define (sort-helper x xs) (
    if (empty? x) 
    xs
    (sort-helper (right x) (sorted-insert (left x) xs) )
    )
)

(define (sort x) (sort-helper x ()))  

(define (get-list curr n) (
    if (= n 100)
        (pair n curr)
        (get-list (pair n curr) (add1 n))
    )
)  

(print (sort (get-list () 0)))
