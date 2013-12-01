#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")

(use chap2_1)
;答え見た
(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((< ux 0)
           (cond ((< uy 0)
                  (make-interval (* ux uy) (* lx ly)))
                 ((< ly 0)
                  (make-interval (* lx uy) (* lx ly)))
                 (else
                  (make-interval (* lx uy) (* ux ly)))))
          ((< lx 0)
           (cond ((< uy 0)
                  (make-interval (* ux ly) (* lx ly)))
                 ((< ly 0)
                  (let ((p1 (* lx ly))
                        (p2 (* lx uy))
                        (p3 (* ux ly))
                        (p4 (* ux uy)))
                    (make-interval (min p1 p2 p3 p4)
                                   (max p1 p2 p3 p4))))
                 (else
                  (make-interval (* lx uy) (* ux uy)))))
          (else
           (cond ((< uy 0)
                  (make-interval (* ux ly) (* lx uy)))
                 ((< ly 0)
                  (make-interval (* ux ly) (* ux uy)))
                 (else
                  (make-interval (* lx ly) (* ux uy))))))))
