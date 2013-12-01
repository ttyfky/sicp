#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_1)
(use chap2_2)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter 
         (lambda (positions) (safe? k positions))
         (flatmap 
          (lambda (rest-of-queens);一部だけqueenを配置した物
            (map (lambda (new-row);1~sizeまでのcolumn
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position row k rest-of-queens)
  (cons (list k row) rest-of-queens))
;現状とk列目row行目
(define empty-board ())

(define (safe? k positions)
  (define (iter num)
    (cond ((num < 1) #t)
	  
	  (iter (- num 1)))
	(iter k (cadr positions))
