#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap1_1)
;(use chap1_2)
;(use chap1_3)
(use chap2_1)

(define (mycons a b)
  (* (expt 2 a) (expt 3 b)))

(define (mycar c)
  (define (iter x count)
    (if (> (abs (remainder x 2)) 0)
        count
        (iter (/ x 2) (+ count 1))))
  (iter c 0))

(define (mycdr c)
  (define (iter x count)
    (if (> (abs (remainder x 3)) 0)
        count
        (iter (/ x 3) (+ count 1))))
  (iter c 0))

(define pair (mycons 3 5))
(display (mycar pair))
(display (mycdr pair))