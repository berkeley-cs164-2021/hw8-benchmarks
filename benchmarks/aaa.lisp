(let ((x (read-num)))
  (do (+ 1 x)
      (add1 x)
      (+ (+ 1 x) (add1 x))
      (let ((x (add1 x)))
        (+ x (read-num))
      )
  )    
)