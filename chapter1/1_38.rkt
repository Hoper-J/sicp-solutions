#lang sicp

; l 指代 last
(define (f n d i l)
  (/ (n i) (+ (d i) l)))
  
(define (cont-frac n d k)
  (define (try l k)
    (let ((next (f n d k l)))
      (if (= k 1)
          next
          (try next (- k 1)))))
  
  (try 0 k))

(define (d i)
  (let ((i/3 (quotient (+ i 1) 3))
        (i%3 (remainder (+ i 1) 3)))
    (if (= i%3 0)
        (expt 2 i/3)
        1)))
      
(cont-frac (lambda (i) 1.0)
           d
           100)

  

    