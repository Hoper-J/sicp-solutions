#lang sicp

; 这里是迭代的方法，要写递归的话把f拆进try里面
(define tolerance 0.0001)

; l 指代 last
(define (f n d i l)
  (/ (n i) (+ (d i) l)))
  
(define (cont-frac n d k)
  (define 1/theta (/ 1 1.618))
  (define (close-enough? next)
    (< (abs (- next 1/theta)) tolerance))
  (define (try l k)
    (let ((next (f n d k l)))
      (if (= k 1) ; 因为这里最后return的是next，而非之前result，所以到k=1就可以
          next
          (try next (- k 1)))))
  
  (let ((value (try 0 k)))
        (if (close-enough? value)
            value
            (error "k不够大，无法精确到4位，k =" k
                   "value: " value))))
 
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

  

    