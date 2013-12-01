#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_define)

(define (same-parity first . ts)
  (define pred (if (even? h) even? odd?))
  (define (filter p lis)
    (cond ((null? lis) lis)
          ((p (car lis)) (cons (car lis) (filter p (cdr lis))))
          (else (filter p (cdr lis)))))
  (cons first (filter pred ts)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
