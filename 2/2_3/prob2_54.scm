#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)


(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        (else #f)))

(equal? '(a (b c) d) '(a (b c) d))
(equal? '(a (b (c d))) '(a (b (c d))))
(equal? '() '())