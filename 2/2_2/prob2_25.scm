#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)



;---1---
(car (cdaddr '(1 3 (5 7) 9)))

;---2---
(caar '((7)))
;---3---
(cadadr ;567 
 (cadadr ;43
  (cadadr'(1 (2 (3 (4 (5 (6 7)))))))));12
;(7 ()) a
;(6 (7 ())) d
;((6 (7 ())) ()) a
;(5 ((6 (7 ())) ()) d
;a
;d 4
;a
;d 3
;a
;d 2
;a
;d 1