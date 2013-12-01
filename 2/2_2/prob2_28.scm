#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define (fringe tree)
  (cond ((null? tree) '())
	(else (cond ((not (pair? tree)) (list tree))
		(else (append (fringe (car tree))
			      (fringe (cdr tree))))))))

(define x '(1 2 3))
(define x (list (list 1 2) (list 3 4)))
(fringe x)


