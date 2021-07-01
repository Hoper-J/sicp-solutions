#lang sicp

(define tolerance 0.00001)

(define (print-fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(print-fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)


; 比较步数
(newline)

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (display-step guess step)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ step 1)))))
  (try first-guess 1))

(define (display-step guess step)
  (display "步数: ") (display step)
  (display "近似值: ") (display guess) (newline))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)