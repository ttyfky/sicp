#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define (subsets s)
  (if (null? s) (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (sub)
			    (append  (list (car s)) sub))
			  rest)))))
(display (subsets (list 1 2 3)))


