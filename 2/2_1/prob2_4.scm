#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap1_1)
;(use chap1_2)
;(use chap1_3)
(use chap2_1)

(define (mycons x y)
  (lambda (m) (m x y)))

(define (mycar z)
  (z (lambda (p q) p)))

;myconsではラムダ式が帰ってくる
;(car (cons x y)))
;(car (lambda (m) (m x y))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;((x y) x)
;return x

(define (mycar z)
  (z (lambda (p q) q)))