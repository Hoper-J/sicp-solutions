#lang scheme
; 精简了一下，把a删除了
(define (iter-expt b n )
  (define (odd? n) (= (remainder n 2) 1))  
  (define (square x) (* x x))

  (cond
    ((= n 0) 1)
    ((= n 1) b)
    ((odd? n) (* b (iter-expt (square b) (/ (- n 1) 2))))
    (else (iter-expt (square b) (/ n 2)))))



(iter-expt 2 10)
