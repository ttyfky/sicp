;fixed-point
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;repeat˜
(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (> n 0)
      (compose f (repeated f (- n 1)))
      identity))
;average-damp
(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))
;expt
(define (expt b n)
  (define (fast-expt-iter b counter product)
    (define (even? n)
      (= (remainder n 2) 0))
    (define (square x)
      (* x x))
    (cond ((= counter 0) product)
	  ((even? counter) (fast-expt-iter (square b) (/ counter 2) product))
	  (else (fast-expt-iter b (- counter 1) (* product b)))))
  (fast-expt-iter b n 1))
;n-root
(define (n-root n m x)
  (fixed-point ((repeated average-damp m)
	       (lambda (y) (/ x (expt y (- n 1)))))
	       1.0))
(n-root 8 2 256)

;4 2
;5 2
;6 2
;7 2
;8 3

