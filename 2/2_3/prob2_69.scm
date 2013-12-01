#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

;; sicp ex 2.69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (if (null? (cdr pairs))
      (car pairs)
      (successive-merge (adjoin-set (make-code-tree (car pairs)
                                                    (cadr pairs))
                                    (cddr pairs)))))

(define tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
;((leaf A 4) ((leaf B 2) ((leaf D 1) (leaf C 1) #0=(D C) 2) #1=(B . #0#) 4) (A . #1#) 8)