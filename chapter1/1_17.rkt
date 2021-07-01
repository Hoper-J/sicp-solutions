#lang scheme

(define (fast-muti a b)
  (define (double x) (* x 2))
  (define (even? n) (= (remainder n 2) 0))
  (define (halve x)
    (cond
      ((even? x) (/ x 2))
      (else "不是偶数")))

  (cond
    ((= b 1) a)
    ((even? b) (fast-muti (double a) (halve b)))
    (else (+ a (fast-muti a (- b 1))))))

(fast-muti 3 6)
