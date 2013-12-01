#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((rec (entry set-of-records)))
        (let ((k (key rec)))
          (cond ((= given-key k) rec)
                ((< given-key k) 
                 (lookup given-key (left-branch set-of-records)))
                ((> given-key k) 
                 (lookup given-key (right-branch set-of-records))))))))
