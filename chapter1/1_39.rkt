#lang sicp

; l 指代 last
(define (f n d x i l)
  (/ (n x i) (+ (d i) l)))

(define (cont-frac n d x k)
  (define (try l k)
    (let ((next (f n d x k l)))
      (if (= k 1)
          next
          (try next (- k 1)))))
  
  (try 0 k))

(define (tan-cf x k)
  (define (n x i) (if (= i 1) x (- (* x x))))
  (define (d i) (+ -1 (* 2 i )))
  
  (cont-frac n d x k))

(tan-cf 10.0 100)

  

