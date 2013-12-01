#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)
;;map
(define (mymap p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
	      '() sequence))
(mymap (lambda (x) (+ x 1)) '(1 2 3))
;;append
(define (myappend seq1 seq2)
  (accumulate cons seq2 seq1))
(myappend '(1 2 3) '(4 5 6))
;;length
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
(length '(1 2 3 4 5 6))
