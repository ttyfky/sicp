(define (cont-frac n d k)
  (if (> k 0)
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))
       (/ (n k) (d k))))

(display (cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11))

(define (cont-frac2 n d k)
 (define (cont-iter k result)
  (if (> k 0)
     (cont-iter (- k 1) (/ (n k) (+ (d k) result)))
     result))
 (cont-iter k 0))
  

;;;;
(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (cont-frac n d k)
  (define (combiner x cf)
    (/ (n x) (+ (d x) cf)))
  (define (term i) i)
  (define (next i) (+ i 1))
  (accumulate-rec combiner (/ (n k) (d k)) term 1 next (- k 1)))

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
