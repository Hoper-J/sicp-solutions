#lang sicp

; 1.32(a)
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define sum-combiner +)
  (define sum-null-value 0)
  (accumulate sum-combiner sum-null-value term a next b))

(define (product term a next b)
  (define product-combiner *)
  (define product-null-value 1)
  (accumulate product-combiner product-null-value term a next b))

; 1.32(b) 运行正常
(define (iter-accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
    (iter a null-value))

; 下为测试用例
(define (cube x) (* x x x))
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

(define (factorial b)
  (define (fac-term n) n)
  (define (fac-next n) (+ n 1))
  (product fac-term 1 fac-next b))

(factorial 4)