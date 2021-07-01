#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; 1.22
(define (timed-prime-test min max)
  (newline)
  (start-prime-test min max (runtime)))

(define (start-prime-test min max start-time)
  (display (search-for-primes min max))
  (report-prime (- (runtime) start-time)))

(define (search-for-primes min max)
  (cond ((> min max) "范围内没有素数")
        ((even? min) (search-for-primes (+ min 1) max))
        ((prime? min) min)
        (else (search-for-primes (+ min 2) max))))
        
(define (report-prime elapsed-time)
  (newline)
  (display " *** ")
  (display elapsed-time))

(define (even? n)
  (= (remainder n 2) 0))


(timed-prime-test 1000 10000)
(timed-prime-test 10000 100000)
(timed-prime-test 100000 1000000)