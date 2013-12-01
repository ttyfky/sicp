#!/usr/bin/env gosh

;a 再帰
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))
(define (fact n)
  (define (pop a) a)
  (define (inc x) (+ x 1))
  (product pop  1 inc n))

(define (quota-pi n)
  (define (inc x) (+ x 1))
  (define (square y) (* y y))
  (define (calc a)
    (* 1.0 (/ (* (* 2 a) (* 2 (+ a 1))) 
       (square (+ (* 2 a) 1)))))
  (product2 calc 1 inc n))
(quota-pi 1000)

;b 反復
(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))
