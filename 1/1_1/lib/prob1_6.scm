;1_6
(define (abs x)
  (if (> 0 x)
      (- 0 x)
      x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
 (if (good-enough? guess x)
  guess
  (sqrt-iter (improve guess x )
	     x)))
;;;;;;;;;;;
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))
(define (sqrt-iter2 guess x)
 (new-if (good-enough? guess x)
  guess
  (sqrt-iter2 (improve guess x )
	     x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;(if (= 2 2) (* 5 4) (unexist))
;(new-if (= 2 2) (* 5 4) (unexist))
;ifは特殊形式であるため評価後半のパラメータを評価しないが，
;new-ifは作用的順序で評価を行なっているため無限ループ