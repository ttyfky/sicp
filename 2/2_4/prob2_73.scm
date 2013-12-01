#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
;----a----
;タグが定義されていない

;----b----
(define (install-deriv-package)
  (define (addend s) (car s))
  (define (augend s) 
    (if (null? (cddr s))
	(cadr s)
	(cons '+ (cdr s))))
  
  (define (multiplier p) (car p))
  (define (multiplicand p)
    (if (null? (cddr p))
	(cadr p)
	(cons '* (cdr p))))
  
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))

  (define (deriv-prod exp var)
    (make-sum
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))
  
  
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-prod)
  'done)

;----c----
(define (install-deriv-expo-package)
  (define (base exponentiation) (car exponentiation))
  (define (exponent exponentiation) (cadr exponentiation))
  
  (define (deriv-expo exp var)
    (make-product
     (make-product (exponent exp)
		   (make-exponentiation (base exp)
					(make-sum (exponent exp) -1)))
     (deriv (base exp) var)))
  
  
  (put 'deriv '** deriv-expo)
  'done)

;----d----
;putの中身を入れ替える

(deriv '(+ (** x 3) (+ (** x 2) (+ x 1))) 'x)