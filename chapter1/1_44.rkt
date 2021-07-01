#lang sicp

(define dx 0.0000001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx))) 3)))

; 用法
; (((repeated (smooth f)) n) x)

(define (repeated f)
  (lambda (times)
    (lambda (x)
      (if (= times 1) (f x)
          (f (((repeated f) (- times 1)) x))))))

(((repeated (smooth (lambda (x) (* 2 x)))) 2) 3)