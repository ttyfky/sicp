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

;deriv
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
          (/ (- (g (+ x dx)) (g x))
             dx)))
;newton-tranform
(define (newton-transform g)
  (lambda (x)
          (- x (/ (g x) ((deriv g) x)))))
;newtons-method
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;cubic
(define (cubic a b c)
  (define (cube i) (* i i i))
  (define (square i) (* i i))
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
    
(newtons-method (cubic 2 3 4) 1)

