#lang sicp

; product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; factorial 阶乘
(define (factorial b)
  (define (fac-term n) n)
  (define (fac-next n) (+ n 1))
  (product fac-term 1 fac-next b))

(factorial 4)

; pi 的近似
(define (pi-appr n)
  (define (pi-term i)
    (/ (+ 2 (* (quotient i 2) 2)) (+ 3 (* (quotient (- i 1) 2) 2))))
  (define (pi-next i) (+ i 1))

  (* 4 (product pi-term 1 pi-next n)))

(pi-appr 6)
 
; 迭代 product
(define (iter-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
