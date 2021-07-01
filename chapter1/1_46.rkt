#lang sicp

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

; 重写 sqrt 和 fixed-point 过程，写完测试一下
(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(sqrt 4)

(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? guess)
    (< (abs (- guess (next guess))) tolerance))
  (define (next guess) (f guess))
  ((iterative-improve close-enough? next) 1.0))

(define (sqrt2 x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt2 4)

