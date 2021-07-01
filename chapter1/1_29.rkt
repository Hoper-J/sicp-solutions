#lang sicp

(define (even? x)
  (= (remainder x 2) 0))

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson a b n)
  (define h (/ (- b a) n))
  (define (yk k) (cube (+ a (* h k))))
  (define (mutiplier k) (cond ((= k 0) 1)
                              ((= k n) 1)
                              ((even? k) 2)
                              (else 4)))
  (define (sps-term k) (* (* (yk k)) (mutiplier k)))
  (define (sps-next k) (+ k 1))
  
  (* (/ h 3) (sum sps-term 0 sps-next n)))


(simpson 0 1 100)