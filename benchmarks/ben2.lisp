(print (+ 
    (let ((x 1))
        (let ((y (read-num)))
            (+ x y)))
    (let ((x 2)) 
        ( let ((y (read-num)))
            (+ x y)))))