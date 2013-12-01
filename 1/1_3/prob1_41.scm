(define (double f)
  (lambda (x) (f (f x))))
(define (inc x)
  (+ x 1))
(((double (double double)) inc) 5)
;doubleが8個になってincが16個になる