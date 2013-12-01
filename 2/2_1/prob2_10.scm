#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap2_1)


(define (div-interval x y)
  (let ((upper-y (upper-bound y))
        (lower-y (lower-bound y)))
    (if (< (* upper-y lower-y) 0)
        (error "spanning zero value is not good")
        (mul-interval x
                      (make-interval (/ 1.0 upper-y)
                                     (/ 1.0 lower-y))))))
;なぜダメ？誤差100%を超えるケースのため？

;;
(define hoge (make-interval 2.5 4.5)) ;3で誤差50%
(define fuga (make-interval -1 3)) ;2で誤差150%

(div-interval hoge fuga)