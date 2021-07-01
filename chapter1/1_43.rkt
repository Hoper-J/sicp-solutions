#lang sicp

(define (repeated f)
  (lambda (times)
    (lambda (x)
      (if (= times 1) (f x)
          (f (((repeated f) (- times 1)) x))))))

(((repeated (lambda (x) (* x x))) 2) 5)

; 下面这个定义与上面等同
;(define (((repeated f) times) x)
;  (if (= times 1) (f x)
;      (f (((repeated f) (- times 1)) x))))

; 用上compose，本质一样
;(define (compose f g)
;  (lambda (x) (f (g x))))

;(define (repeated f)
;  (lambda (times)
;    (lambda (x)
;      (if (= times 1) (f x)
;          ((compose f ((repeated f) (- times 1))) x)))))



