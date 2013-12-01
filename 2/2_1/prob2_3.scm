#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap1_1)
;(use chap1_2)
;(use chap1_3)
(use chap2_1)

;底辺の座標と高さを保持する
(define (make-rectangle seg height)
  (cons seg height))

(define (bottom rect)
  (define (square x) (* x x))
  (let ((seg (car rect)))
    (let ((sp (start-segment seg))
          (ep (end-segment seg)))
      (let ((x1 (x-point sp))
            (y1 (y-point sp))
            (x2 (x-point ep))
            (y2 (y-point ep)))
        (sqrt (+ (square (- x2 x1)) (square (- y2 y1))))))))

(define (height rect) (cdr rect))

;長方形作成
(define seg (make-segment (make-point 0 0) (make-point 10 0)))
(define rect (make-rectangle seg 5))

;長さと面積
(define (perimeter rect)
  (* 2 (+ (bottom rect) (height rect))))
(define (area rect)
  (* (bottom rect) (height rect)))

;;
(display (perimeter rect))
(newline)
(display (area rect))
(newline)