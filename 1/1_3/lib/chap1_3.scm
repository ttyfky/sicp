#!/usr/bin/env gosh

;sum
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

;-------------1_29-----------------
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (inc n) (+ n 2))
  (* (/ h 3.0) 
     (+  (y 0)
	 (* 4 (sum y 1 inc (- n 1)))
	 (* 2 (sum y 2 inc (- n 1)))
	 (y n))))
;シンプソンの公式
;2次式(ラグランジュ補間多項式)のため1次式(台形公式)より精度がいい
;2つの偶数番目，1つの奇数番目のfを足していくイメージ

;-------------1_30-----------------
(define (sum2 term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

;-------------1_31-----------------
;a 再帰
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))
(define (fact n)
  (define (pop a) a)
  (define (inc x) (+ x 1))
  (product pop  1 inc n))

(define (quota-pi n)
  (define (inc x) (+ x 1))
  (define (square y) (* y y))
  (define (calc a)
    (* 1.0 (/ (* (* 2 a) (* 2 (+ a 1))) 
       (square (+ (* 2 a) 1)))))
  (product2 calc 1 inc n))

;b 反復
(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

;-------------1_32-----------------
;a 再帰
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))
;b 反復
(define (accumulate2 combiner null-value term a next b)
  (if (> a b)
      null-value
      	(accumulate combiner (combiner null-value (term a)) term (next a) next b)))


(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;-------------1_33-----------------
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
  (cond ((> a b) null-value)
	((filter a)
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

(define (filtered-sum filter term a next b)
  (filtered-accumulate + 0 filter term a next b))

(define (filtered-product filter term a next b)
  (filtered-accumulate2 * 1 filter term a next b))

;-------------1_34-----------------
;(f f)
;(f 2)
;(2 2)


;fixed-point
(define golerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

;-------------1_35-----------------
(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
	       1.0))

;-------------1_36-----------------
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

;-------------1_37----------------
-(define (cont-frac n d k)
  (if (> k 0)
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))
       (/ (n k) (d k))))

(define (cont-frac2 n d k)
 (define (cont-iter k result)
  (if (> k 0)
     (cont-iter (- k 1) (/ (n k) (+ (d k) result)))
     result))
 (cont-iter k 0))
  

;11回で4桁目まで収束

;-------------1_38----------------
(define (euler n d k)
  (define (combiner cf x)
    (/ (n x) (+ (d x) cf)))
  (define (term i) (+ (- k i) 1))
  (define (next i) (+ i 1))
  (accumulate-iter combiner (/ (n k) (d k)) term 1 next k))

(euler (lambda (i) 1.0)
       (lambda (i) 
	 (if (= (remainder i 3) 2)
	     (* (+ (/ i 2) 1) 2)
	     1))
       100)

;-------------1_39----------------
;上手くいかず

;-------------1_40----------------
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
    
;-------------1_41----------------
define (double f)
  (lambda (x) (f (f x))))
(define (inc x)
  (+ x 1))
(((double (double double)) inc) 5)
;doubleが8個になってincが16個になる

;-------------1_42----------------
(define (compose f g)
  (lambda (x) (f (g x))))

;-------------1_43----------------
(define (repeated f n)
  (if (> n 0)
      (compose f (repeated f (- n 1)))
      identity))

;(square ((repeat f 1) x)) n=2
;(square (square ((repeat f 0) x))) n=1
;(square (square (identity x)))

;-------------1_44----------------
(define (smooth f)
  (let ((dx 0.0001))
    (lambda (x) (/ 
		 (+ (f (- x dx))
		    (f x)
		    (f (+ x dx))) 
		 3))))
(define (n-fold-smooth f n)
  (repaeted (smooth f) n))
;-------------1_45----------------

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
;-------------1_46----------------

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

(define (iterative-imp check improve)
  (lambda (guess)
    (if (check guess)
	guess	
	((iterative-imp check improve) (improve guess)))))