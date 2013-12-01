#!/usr/bin/env gosh

;a 再帰
(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (term a)
		    (filtered-accumulate combiner null-value filter term (next a) next b))
	  (filtered-accumulate combiner null-value filter term (next a) next b))))


;b 反復
(define (filtered-accumulate2 combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (begin
	    (display a)
	    (newline)
	  (combiner (term a)
		    (filtered-accumulate2 combiner (combiner null-value (term a)) filter term (next a) next b)))
	  (combiner (term a)
		    (filtered-accumulate2 combiner null-value filter term (next a) next b)))))

(define (filtered-accumulate2 combiner null-value filter term a next b)
  (cond ((> a b) null-value)
	((filter a)
	 (display a)
	    (newline)
	  (combiner (filtered-accumulate2 combiner (combiner null-value (term a)) filter term (next a) next b)))
	(else (filtered-accumulate2 combiner null-value filter term (next a) next b))))

;sumof-square-prime
(define (sumof-square-prime a b)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
	  (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (prime? n)
    (= n (smallest-divisor n)))
  (define (inc x) (+ x 1)) 
  (define (square y) (* y y)) 
  (filtered-sum prime? square a inc b))

;product-gcd
(define (productof-gcd n)
  (define (gcd a b)
    (if (= b 0)
      a
      (gcd b (remainder a b))))
  (define (so? a)
    (if (and (> n a) (= 1 (gcd a n)))
	#t
	#f))
  (define (inc x) (+ x 1)) 
  (define (term x) x)
  (filtered-product so? term 1 inc n))

;filtered-sum
  (define (filtered-sum filter term a next b)
  (filtered-accumulate + 0 filter term a next b))
(sumof-square-prime 1 5)

;filtered-product
(define (filtered-product filter term a next b)
  (filtered-accumulate2 * 1 filter term a next b))

(productof-gcd 10)


