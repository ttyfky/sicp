#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_define)

(define (for-each func lis)
  (cond ((null? lis) (newline))
        (else (func (car lis)) (for-each func (cdr lis)))))

(for-each (lambda (x) (newline) (display x)) 
	  (list 57 321 88))
