#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

(define (union-set set1 set2)
  (list->tree (union-list (tree->list set1) (tree->list set2))))

(define (intersection-set set1 set2)
  (list->tree (intersection-list (tree->list set1) (tree->list set2))))

          
(define (union-list l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        (else
         (let ((h1 (car l1))
               (h2 (car l2)))
           (cond ((= h1 h2) (cons h1 (union-list (cdr l1) (cdr l2))))
                 ((< h1 h2) (cons h1 (union-list (cdr l1) l2)))
                 ((< h2 h1) (cons h2 (union-list l1 (cdr l2)))))))))

(define (intersection-list l1 l2)
  (cond ((or (null? l1) (null? l2)) '())
        (else 
         (let ((h1 (car l1))
               (h2 (car l2)))
           (cond ((= h1 h2) (cons h1 (intersection-list (cdr l1) (cdr l2))))
                 ((< h1 h2) (intersection-list (cdr l1) l2))
                 ((< h2 h1) (intersection-list l1 (cdr l2))))))))