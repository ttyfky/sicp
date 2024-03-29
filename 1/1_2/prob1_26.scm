(use slib)
(require 'random)
(use srfi-19)

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
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

(define (prime? n)
   (fast-prime? n 10))

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
(search-for-primes 1000 1020)
(search-for-primes 10000 10200)
(search-for-primes 100000 100200)
(search-for-primes 1000000 1002000)