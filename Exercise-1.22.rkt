#lang racket
"Excersize 1.22"

; Exercise 1.22: Most Lisp implementations include a prim- itive called runtime that returns an
; integer that specifies the amount of time the system has been running (measured, for example,
; in microseconds). The following timed-prime-test procedure, when called with an integer n, prints
; n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed 
; by the amount of time used in performing the test.

(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n current)
    (cond ((> (square current) n) n)
          ((divides? current n) current)
          (else (find-divisor n (+ current 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= n (smallest-divisor n)))

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
        (null))) ; ok? an 'else' block was required, need a no-op

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))


"test (prime? 10) -> expect false"
(prime? 10)
"test (prime? 11) -> expect true"
(prime? 11)

(define (even? n) (= (remainder n 2) 0))

(define (search-for-primes start end prime-count)
  (define (search-iter current-n primes-found)
    (if (>= primes-found prime-count)
        (prime-count)
        (search-iter (+ current-n 2) (if (prime? current-n)
                                         (+ prime-count 1)
                                         (prime-count)))))
  (search-iter (if (even? start) (+ start 1) start) 0))

(search-for-primes 1 100 5)