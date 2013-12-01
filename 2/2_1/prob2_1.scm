#! /usr/bin/env gosh
(add-load-path "lib")



(define (make-rat n d)
  (let ((an (abs n)) 
	(ad (abs d)))
    (let ((g (gcd an ad)))
	(cond ((or (< n 0) (< d 0))
	      (cons (* -1 (/ an g))
		    (/ ad g)))
	      (else (cons n d))))))
(make-rat 3 -5)

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))