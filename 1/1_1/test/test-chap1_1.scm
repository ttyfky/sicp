#!/usr/bin/env gosh
(use test.unit) 
(use chap1_1)

(define-test-case "chap1_1 test" 
  ("calc test"
   (assert-equal -37/150 (calc 1))
   )
  ("squre test"
   (assert-equal 25 (square 5))
   )
  ("sumof"
   (assert-equal 50 (sum-of-square 5 5))
   )
  ("selector"
   (assert-equal 13 (selector 1 2 3))
   (assert-equal 1300 (selector 10 20 30))
   )
  ("abs"
   (assert-equal (a-plus-abs-b 3 4) (a-plus-abs-b 3 -4)))
  ("sqrt2"
      (assert-equal 9.0 (round (sqrt2 81))))
  ("cbrt"
      (assert-equal 3.0 (round(cbrt  27))))
  )