(use srfi-19)

(define (square x)
  (* x x))

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
x  (display (time-second elapsed-time))
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