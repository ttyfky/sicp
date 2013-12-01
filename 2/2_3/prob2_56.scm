#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
	((exponentiation? exp)
	 (make-product (make-product (exponent exp) (make-exponentation (base exp) (- (exponent exp) 1)))
		       (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**))) 
(define (base s)
  (cadr s))
(define (exponent s)
  (caddr s))
(define (make-exponentation a1 a2)
  (cond ((=number? a2 0) 1) 
	((=number? a2 1) a1) 
	((and (number? a1) (number? a2)) (+ a1 a2)) 
	(else (list '+ a1 a2)))) 

(deriv '(+ (** x 3) (+ (** x 2) (+ x 1))) 'x)