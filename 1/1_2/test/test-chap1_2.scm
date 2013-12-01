#!/usr/bin/env gosh
(use test.unit) 
(use chap1_2)

(define-test-case "chap1_2 test" 
  ("inc"
   (assert-equal 5 (inc 4)))
  ("dec"
   (assert-equal 3 (dec 4)))
  ("fib-rec"
   (assert-equal 25 (fib-rec 5)))
  ("pow"
   (assert-equal 25 (pow 5 2)))
  ("sqrt"
      (assert-equal 9.0 (round (sqrt 81))))
 
  )