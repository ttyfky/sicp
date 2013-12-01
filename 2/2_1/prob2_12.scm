(define (make-center-width c w)
  (make-interval (- c w) (+ c W)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (lower-bound i) (upper-bound i)) 2))

;中央値と許容誤差範囲(パーセント)を与える
(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100.0)))

(define (percent i)
  (* (/ (width i) (center i)) 100.0))