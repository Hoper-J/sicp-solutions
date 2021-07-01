#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

; 测试一下是否正确
((double (lambda (x) (+ x 1))) 1)

(define inc
  (lambda (x) (+ x 1)))

(((double (double double)) inc) 5)