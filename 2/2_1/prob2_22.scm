#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_define)

(1 square 
  (lambda (x) (* x x)))

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
    (iter items '()))
;(9 4 1)となる
;先にcarで取り出したものがanswer用のconsの後ろ部分に入れられていくため
;-----------
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))
; (((() . 1) . 4) . 9)となる
;nilを最初の要素としてanswerに入れているため

(define value (list 1 2 3))
(square-list1 value)


