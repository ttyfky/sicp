#! /usr/bin/env gosh
;(add-load-path "lib")

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

(define seg (make-segment (make-point 2 3) 
                           (make-point 12 15))) 
  
(print-point (midpoint-segment seg))
