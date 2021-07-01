#lang scheme

(define (iter-expt b n )
  (cond
    ((= n 0) 1)
    ((= n 1) b)
    ((odd? n) (fast-muti b (iter-expt (square b) (halve (- n 1)))))
    (else (iter-expt (square b) (halve n)))))

(define (odd? n)
  (= (remainder n 2) 1))

(define (square x)
  (fast-muti x x))

(define (fast-muti a b)
  (cond
    ((= b 1) a)
    ((even? b) (fast-muti (double a) (halve b)))
    (else (+ a (fast-muti a (- b 1))))))

(define (double x)
  (* x 2))

(define (halve x)
  (cond
    ((even? x) (/ x 2))
    (else "不是偶数")))

(define (even? n)
  (= (remainder n 2) 0))
