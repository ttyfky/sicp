(use slib)
(require 'random)
(use srfi-19)

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
(define (fermat-test n a)
     (expmod a n n))


(define (fast-prime?-iter n a)
  (cond ((= a n) #t)
	((fermat-test n a) (fast-prime?-iter n (+ a 1)))
	(else #f)))



(define (prime? n)
   (fast-prime?-iter n 1))

(display (prime? 561))
(display(prime? 1105))
(display(prime? 1729))
(display(prime? 2465))
(display(prime? 2821))
(display(prime? 6601))