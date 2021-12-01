(define (leaf-test n)
(
    if (= n 0) (
        let ((x n)) x
    ) (
        do (leaf-test (sub1 n)) (leaf-test (sub1 n)) (leaf-test (sub1 n))
    )
)
)
(leaf-test 15)
