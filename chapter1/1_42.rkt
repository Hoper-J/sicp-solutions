#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define square
  (lambda (x) (* x x)))

(define inc
  (lambda (x) (+ 1 x)))

((compose square inc) 6)
