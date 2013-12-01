#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))
;;
(define r1 (make-center-percent 6 15))
(define r2 (make-center-percent 4 5))

(display (par1 r1 r2))
(newline)
(display (par2 r1 r2))
(newline)
;変えず
(display (center (div-interval r1 r1)))
(newline)
(display (center (div-interval r1 r2)))
(newline)
(display (percent (div-interval r1 r1)))
(newline)
(display (percent (div-interval r1 r2)))
(newline)
(newline)
;r1の誤差を少なくする
(define r1 (make-center-percent 6 0.05))
(display (center (div-interval r1 r1)))
(newline)
(display (center (div-interval r1 r2)))
(newline)
(display (percent (div-interval r1 r1)))
(newline)
(display (percent (div-interval r1 r2)))
(newline)
(newline)
;r2の誤差を少なくする
(define r1 (make-center-percent 6 15))
(define r2 (make-center-percent 4 0.05))
(display (center (div-interval r1 r1)))
(newline)
(display (center (div-interval r1 r2)))
(newline)
(display (percent (div-interval r1 r1)))
(newline)
(display (percent (div-interval r1 r2)))
(newline)
(newline)
;除数の誤差が少ないほうが精度は高い 
;r1:15% r2:5%
;1.0460358056265986 center r1/r1
;1.5150375939849625        r1/r2
;29.33985330073351  percent r1/r1
;19.851116625310176         r1/r2

;r1:0.05%
;1.0000005000001249
;1.503796992481203
;0.09999997500000216
;5.049873753156175

;r2:0.05%
;1.0460358056265986
;1.5001128750282187
;29.33985330073351
;15.048871334649903