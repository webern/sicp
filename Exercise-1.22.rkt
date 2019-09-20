#lang racket
"Excersize 1.22"

; Exercise 1.22: Most Lisp implementations include a prim- itive called runtime that returns an
; integer that specifies the amount of time the system has been running (measured, for example,
; in microseconds). The following timed-prime-test procedure, when called with an integer n, prints
; n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed 
; by the amount of time used in performing the test.

(define (prime? n) (= n 0))

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
        (display " not prime ")))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))