#lang sicp

; 测试运行结果正确
(define (root-of-n times)
  (fixed-point ((repeated (average-damp f)) times)
               1.0))
  