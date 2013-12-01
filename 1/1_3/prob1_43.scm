(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (> n 0)
      (compose f (repeated f (- n 1)))
      identity))

(define (square i) (* i i))

((repeated square 2) 5)
;(lambda (x) (square ((repeat f 1) x))) n=2
;(lambda (x) (square ((compose f 0) x)))
;(lambda (x) (square (lambda (x) (square ((repeat f 0) x))) x)) n=1
;(lambda (x) (square ((lambda (x) (square (identity x))) x))) n=0
