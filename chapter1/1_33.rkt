#lang sicp

; 1.33 过滤器
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

; prime?
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; sum 的过滤器版本
(define (filtered-sum filter term a next b)
  (define sum-combiner +)
  (define sum-null-value 0)
  (filtered-accumulate filter sum-combiner sum-null-value term a next b))

; 1.33(a) 素数之和(a到b)
(define (sum-prime a b)
  (define (term a) a)
  (define (next a) (+ a 1))

  (filtered-sum prime? term a next b))

(sum-prime 1 7)

; product 的过滤器版本
(define (filtered-product filter term a next b)
  (define product-combiner *)
  (define product-null-value 1)
  (filtered-accumulate filter product-combiner product-null-value term a next b))

; 1.2.5 gcd 最大公约数
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; 1.33(b)
(define (product-gcd a b)
  (define (term a) a)
  (define (next a) (+ a 1))
  (define (gcd=1? a) (= (gcd a b) 1))
  
  (filtered-product gcd=1? term a next b))

(product-gcd 1 10)
  

