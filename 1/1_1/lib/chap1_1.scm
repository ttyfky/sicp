#! /usr/bin/env gosh
(define-module chap1_1
  (export calc)
  (export square)
  (export sum-of-square)
  (export selector)
  (export a-plus-abs-b)
  (export sqrt2)
  (export cbrt)
  )

;1_2
(define (calc x)
  (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
  )

;1_3
(define (square x) (* x x))
(define (sum-of-square x y)
  (+ (square x) (square y)))
(define (selector x y z)
  (cond ((>= x y)
	 (cond ((>= y z) (sum-of-square x y))
	       (else (sum-of-square x z)))
	 )
	(else
	 (cond ((>= x z) (sum-of-square x y))
	       (else (sum-of-square y z)))
	 )
	))

;1_4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)) 

;1_5
(define (p) (p))
(define (test x y)
  (if (= x 0)0
      y))
;(test 0 (p))
;無限ループする？

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

;1_7
(define (good-enough2? guess preguess)
  (< (abs (- guess preguess)) 0.0001))

(define (sqrt-iter2 guess preguess x)
 (if (good-enough2? guess preguess)
  guess
  (sqrt-iter2 (improve guess x )
	     guess x )))
(define (sqrt2 x)
  (sqrt-iter2 1.0 0 x))

;(sqrt2 0.0001)

;1_8
(define (improve2 guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (cbrt-iter guess preguess x)
 (if (good-enough2? guess preguess)
  guess
  (cbrt-iter (improve2 guess x )
	     guess x )))
(define (cbrt x)
   (cbrt-iter 1.0 0 x))
