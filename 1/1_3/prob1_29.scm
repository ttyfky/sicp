(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))
(define (cal-h a b n)
  (/ (- b a) n))

(define (cal-y a b n k)
  (+ a (* k (cal-h a b n))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (* (/ (cal-h a b n) 3) (sum f () cal-yc b)))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (inc n) (+ n 2))
  (* (/ h 3.0) 
     (+  (y 0)
	 (* 4 (sum y 1 inc (- n 1)))
	 (* 2 (sum y 2 inc (- n 1)))
	 (y n))))
(display (simpson cube 0 1 100))
(display (simpson cube 0 1 1000))
