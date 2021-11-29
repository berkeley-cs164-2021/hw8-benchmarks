(define (aa x y) (+ x 3))
(do (aa 3 (aa (aa 2 3) (aa 0 0)))
    (aa 0 0)
    (aa (aa (add1 0) (add1 (aa 3 4))) (aa 12 10)))