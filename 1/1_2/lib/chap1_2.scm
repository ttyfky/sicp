#!/usr/bin/env gosh
(define-module chap1_2
  (export inc)
  (export dec)
  (export fib-rec)
  (export sqrt)
  (export pow)
)
(use slib)
(load "/usr/local/slib/random.scm")
;-------1_9---------
(define (inc i)
  (+ i 1))

(define (dec i)
  (- i 1))

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

;(plus 4 5)
;(inc (plus (dec 4) 5))
;(inc (inc (plus (dec 3) 5)))
;(inc (inc (inc (plus (dec 2) 5)))))
;(inc (inc (inc (inc (plus (dec 1) 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9
;再帰的
(define (plus a b)
  (if (= a 0)
      b
      (plus (dec a) (inc b))))
;(plus 4 5)
;(plus (dec 4) (plus 5) )
;(plus (dec 3) (plus 6) )
;(plus (dec 2) (plus 7) )
;(plus (dec 1) (plus 8) )
;9
;反復的

;-------------1_10--------------
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
	 ((= y 1) 2)
	 (else (A (- x 1)
		  (A x (- y 1))))))
(A 1 10)
(A 2 4)
(A 3 3)
(define (f n) (A 0 n))
;2n
(define (g n) (A 1 n))
;2^n
(define (h n) (A 2 n))
;2^2^2^....

;----------1_11---------
(define (fib-rec n)
  (if (< n 3)
      n
      (+ (fib-rec (- n 1)) 
         (* 2 (fib-rec (- n 2)))
         (* 3 (fib-rec (- n 3))))))
;1 2 4 11 25...

(define (fib-iter a b c count)
  (if (= count 0) 
      c
      (fib-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
(define (fib-i n)
  (fib-iter 2 1 0 n))

;1_12
(define (pascal l r);行 列
  (cond ((= l 1) 1)
	((= r 1) 1)
        ((= l r) 1)
	(else (+ (pascal (- l 1) (- r 1)) (pascal (- l 1) r)))))

;-------------1_13-------------
;sart
(define (abs x)
  (if (> 0 x)
      (- 0 x)
      x))
(define (good-enough? guess preguess)
  (< (abs (- guess preguess)) 0.0001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess preguess x)
 (if (good-enough? guess preguess)
  guess
  (sqrt-iter (improve guess x )
	     guess x )))
(define (sqrt x)
  (sqrt-iter 1.0 0 x))
;;
(define (pow n count)
    (if (= count 0) 1
	(* n (pow n (- count 1)))))
(define (fi n) 
  (/ (pow (/ (+ 1 (sqrt 5)) 2) n) (sqrt 5)))
;(fi 5)

;-------------1_14--------------
;(cc 11 5)
;(+(cc 11 4)),(cc 6 5)
;(+(cc 11 3)),(cc 7 4),,(+(cc 6 4)),(cc 1 5)
;(+(cc 11 2)),(cc 8 3),,(+(cc 7 2)),(cc 3 4),,,(+(cc 6 3)),(cc 2 4),,return 0
;.....
;プロセスはn<R(n)<=2^nペースで増える？下限が考察不足
;O(n^2)?

;-------------1_15--------------
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
;(sine 12.15)
;(p (sine 4.05)) 
;(p (p (sine 1.35))) 
;(p (p (p (sine 0.45))))
;(p (p (p (p (sine 0.15)))))
;(p (p (p (p (p (sine 0.03))))))
;(p (p (p (p (p 0.03)))))
;a:5回

;0.1:1回
;1:2
;2:3
;3:3
;4:4
;5:4
;6:4
;指数関数的？ステップ：O(log(a))?

;-------------1_16--------------
(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))
(define (fast-expt2-iter b counter product)
  (cond ((= counter 0) product)
	((even? counter) (fast-expt2-iter (square b) (/ counter 2) product))
	(else (fast-expt2-iter b (- counter 1) (* product b)))))
(define (fast-expt2 b n)
  (fast-expt2-iter b n 1))
(fast-expt2 2 3)

;-------------1_17--------------
(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))
(define (multi2 a b)
  (cond ((= 0 b) 0)
	((even? b) (double (multi2 a (halve b))))
	(else (+ a (multi2 a (- b 1))))))

;-------------1_18--------------
(define (fast-multi-iter b counter product)
  (cond ((= counter 0) product)
	((even? counter) (fast-multi-iter (double b) (halve counter) product))
	(else (fast-multi-iter b (- counter 1) (+ product b)))))
(define (fast-multi b n)
  (fast-multi-iter b n 0))

;-------------1_19--------------
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
		   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q) (* a q) (* a p))
                   (+ (* b p) (* a q))
                   p 
                   q
                   (- count 1)))))

;-------------1_20--------------
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;作用的順序
; (gcd 206 40)
;(remainder 206 40)
;6
;(remainder 40 6)
;4
;(remainder 6 4)
;2
;(remainder 4 2)
;0

;;;;;;;;;;;;;;;;
;(gcd 206 40)
;(if (= 40 0) 
;    206 
;    (gcd 40 (remainder 206 40)))
;; 述語部が偽になるため、代替部を評価します。

;(gcd 40 (remainder 206 40))
;(if (= (remainder 206 40) 0) ;; 1回
;    40 
;    (gcd (remainder 206 40) 
;         (remainder 206 
;                    (remainder 206 40))))
;; 述語部が偽になるため、代替部を評価

;(gcd (remainder 206 40) 
;     (remainder 206 (remainder 206 40)))
;(if (= (remainder 206 (remainder 206 40)) 0) ;; ２回
;    (remainder 206 40)
;    (gcd (remainder 206 (remainder 206 40))
;         (remainder (remainder 206 40) 
;                    (remainder 206 (remainder 206 40)))))
;; 述語部が偽になるため、代替部を評価

;(gcd (remainder 206 (remainder 206 40))
;     (remainder (remainder 206 40) 
;                (remainder 206 (remainder 206 40)))))
;(if (= (remainder (remainder 206 40) 
;                  (remainder 206 (remainder 206 40))) ;; ４回
;       0)
;    (remainder 206 (remainder 206 40))
;    (gcd (remainder (remainder 206 40) 
;                    (remainder 206 (remainder 206 40)))
 ;        (remainder (remainder 206 (remainder 206 40))
  ;                  (remainder (remainder 206 40) 
  ;                             (remainder 206 
  ;                                        (remainder 206 40))))))
;; 述語部が真になるため、帰結部を評価

;-------------1_21--------------
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
(smallest-divisor 19999)

(define (prime? n)
  (= n (smallest-divisor n)))

;;;;;expmod;;;;
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

;-------------1_22--------------
(use srfi-19)
(define (timed-prime-test n)
   (newline)
  (display n)
  (start-prime-test n (current-time)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime  (time-difference (current-time)
                        start-time));(- (current-time) start-time))
    #f))
(define (report-prime elapsed-time)
  (display "***")
  (display (time-second elapsed-time))
  (display ".")
  (display (time-nanosecond elapsed-time))
;  (display elapsed-time)
  #t)

(define (search-for-primes l r)
  (search-for-primes-iter (- l 1) r 0))

(define (search-for-primes-iter l r counter)
  (cond ((= l r) (newline))
	((= counter 3) (newline))
	((timed-prime-test (+ l 2)) (search-for-primes-iter (+ l 2) r (+ counter 1)))
	(else (search-for-primes-iter (+ l 2) r counter))))
;(search-for-primes 1000 1020)
;(search-for-primes 10000 10200)
;(search-for-primes 100000 100200)
;(search-for-primes 1000000 1002000)

;-------------1_23--------------
;これが加わるだけ 
;(define (next num)
;  (cond ((< num 3) (+ num 1))
;	(else (+ num 2))))


;多少早くなっているようにも思えたが2倍ではない．
;関数に飛ばす速度が関係している？
;-------------1_24--------------
;一つにつき何回も回すためその分遅くなると予想
;結果は遅くなっているが3倍程度？

;-------------1_25--------------
;結果自体は正しいものが得られる
;この手法ではa^nを計算しきってからmod計算を行うためnの値が大きくなると非常に時間がかかる

;-------------1_26--------------
;n/2プロセスの計算を2回行う必要があるためオーダーも増える
;
;
;-------------1_27--------------
;全部だまされており，正を返してきた
;(define (fast-prime?-iter n a)
;  (cond ((= a n) #t)
;	((fermat-test n a) (fast-prime?-iter n (+ a 1)))
;	(else #f)))
;(define (prime? n)
;   (fast-prime?-iter n 1)
;変更部分

;-------------1_28--------------
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))