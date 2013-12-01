#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define (square-tree-1 tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))

(define (square-tree-2 tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-2 subtree)
             (square subtree)))
       tree))

(square-tree-1 '(1 (2 3) 4))
(square-tree-2 '(1 (2 3) 4))

