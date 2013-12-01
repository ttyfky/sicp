(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-iter combiner (combiner null-value (term a)) term (next a) next b)))

(Define (euler n d k)
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
