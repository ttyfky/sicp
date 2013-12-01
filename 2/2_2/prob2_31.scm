#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define (tree-map func tree)
  (map (lambda (subtree)
	 (if (pair? subtree)
             (tree-map func subtree)
             (func subtree)))
       tree))
(define (square-tree tree) (tree-map square tree))

(square-tree '(1 (2 3) 4))