;average-damp
(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))
;fixed-point
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (define tolerance 0.0001)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-imp close-enough? f) first-guess))
;sqrt
(define (sqrt num)
  (define (close-enough? guess)
    (define tolerance 0.0001)
    (define (square x) (* x x))  
    (< (abs (- num (square guess))) tolerance))
  (define (improve x)
    (define (average x y)
      (/ (+ x y) 2))
    (lambda (guess) (average guess (/ x guess))))
  ((iterative-imp close-enough? (improve num)) 1.0))
;  ((iterative-imp close-enough? (average-damp (lambda (y) (/ num y)))) 1.0))

(define (iterative-imp check improve)
  (lambda (guess)
    (if (check guess)
	guess	
	((iterative-imp check improve) (improve guess)))))



