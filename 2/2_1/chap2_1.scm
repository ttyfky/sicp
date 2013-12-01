#! /usr/bin/env gosh
(add-load-path "lib")
(define-module chap2_1
  (export-all))

;;;;;2.1;;;;;;
(define (make-rat n d)
  (let ((an (abs n)) 
	(ad (abs d)))
    (let ((g (gcd an ad)))
	(cond ((or (< n 0) (< d 0))
	      (cons (* -1 (/ an g))
		    (/ ad g)))
	      (else (cons n d))))))

;;;;;;2.2;;;;;;
;segment
(define (make-segment s e)
  (cons s e))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))
;point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;avarage
(define (midpoint-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point (/ (+ (x-point start) (x-point end)) 2)
                (/ (+ (y-point start) (y-point end)) 2))))



(define (print-point p) 
   (display "(") 
   (display (x-point p)) 
   (display ",") 
   (display (y-point p)) 
   (display ")")
   (newline)) 

;;;;;;;;2.3;;;;;;;;;
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

;長さと面積
(define (perimeter rect)
  (* 2 (+ (bottom rect) (height rect))))
(define (area rect)
  (* (bottom rect) (height rect)))
;;;;;;;2.4;;;;;;;;;
(define (mycons x y)
  (lambda (m) (m x y)))

(define (mycar z)
  (z (lambda (p q) p)))

;myconsではラムダ式が帰ってくる
;(car (cons x y)))
;(car (lambda (m) (m x y))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;((x y) x)
;return x

(define (mycar z)
  (z (lambda (p q) q)))

;;;;;;;;2.5;;;;;;;;;
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


;;;;;;;;;2,6;;;;;;;;;
;実際の計算時に使う
(define (inc x)
  (+ x 1))
(define (to-s z)
  ((z inc) 0))
;probrem
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;;;;;2.7;;;;;;;
(define (add-interval x y)
  (make-interval (+ (lower-bound y) (lower-bound x))
                 (+ (upper-bound y) (upper-bound x))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x 
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))


(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)

;;;;;2.8;;;;;;
(define (sub-interval x y)
  (make-interval (- (lower-bound y) (upper-bound x))
                 (- (upper-bound y) (lower-bound x))))

;;;;;2.9;;;;;


;;;;2.10;;;;;;
(define (div-interval x y)
  (let ((upper-y (upper-bound y))
        (lower-y (lower-bound y)))
    (if (< (* upper-y lower-y) 0)
        (error "spanning zero value is not good")
        (mul-interval x
                      (make-interval (/ 1.0 upper-y)
                                     (/ 1.0 lower-y))))))

;;;;;;2.11;;;;;
