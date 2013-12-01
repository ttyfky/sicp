#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
;              (iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(fold-right / 1 '(1 2 3))
; 3/2
(fold-left / 1 '(1 2 3))
; 1/6

(fold-right list '() '(1 2 3))
; (1 (2 (3 ())))
(fold-left list '() '(1 2 3))
; (((() 1) 2) 3)

(fold-right + 1 '(1 2 3))
;7
(fold-left + 1 '(1 2 3))
;7
;演算の順番によって結果が変わらないこと