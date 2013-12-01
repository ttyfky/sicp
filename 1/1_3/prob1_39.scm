(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-iter combiner (combiner null-value (term a)) term (next a) next b)))

  
(define (cont-frac n d k)
  (define (combiner cf x)
    (/ (n x) (+ (d x) cf)))
  (define (term i) (+ (- k i) 1))
  (define (next i) (+ i 1))
  (accumulate-iter combiner (/ (n k) (d k)) term 1 next k))

(define (tan-cf x k)
  (cont-frac (lambda (i) (* -1 (* x x)))
	     (lambda (i) (- (* 2 i) 1))
	     k))
(define (tan-cf x k)
  (let ((xtanx (cont-frac (lambda (i) (* -1 (* x x)))
                          (lambda (i) (- (* 2 i) 1))
                          k)))
    (* -1 (/ xtanx x))))
(tan-cf (/ 3.14 4) 10)



