#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")


(define upper-bound cdr)
(define lower-bound car)

(define ho (cons 1 2))
(upper-bound ho)