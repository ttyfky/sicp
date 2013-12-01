#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap1_1)
;(use chap1_2)
;(use chap1_3)
(use chap2_1)

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f (n f) x))))
;実際の計算時に使う
(define (inc x)
  (+ x 1))
(define (to-s z)
  ((z inc) 0))
;probrem
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (puls n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

;ポイントは式を何回作用させるかということ

(to-s one)
(to-s (puls one two))