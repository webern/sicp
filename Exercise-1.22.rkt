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
  (cond ((prime? n) (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)  
  (display " *** ")
  (display elapsed-time))



; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive
; odd integers in a specified range. Use your procedure to find the three small- est primes larger
; than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to
; test each prime. Since the testing algorithm has order of growth of Θ(√n), you should expect that
; testing for primes around 10,000 should take about √10 times as long as testing for primes around
; 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support
; the Θ(√n) prediction? Is your result compatible with the notion that programs on your machine run
; in time proportional to the number of steps required for the computation?

(define (search-for-primes start stop)
  (define (my-iter current)
    (timed-prime-test current)
    (cond ((<= current stop) (my-iter (+ current 1)))))
  (my-iter start))

; "(search-for-primes 1000 1019)"
; (search-for-primes 1000 1019)

; "(search-for-primes 10000 10037)"
; (search-for-primes 10000 10037)

; "(search-for-primes 100000 100043)"
; (search-for-primes 100000 100043)

; "(search-for-primes 10000000 10004300)"
; (search-for-primes 10000000 10004300)

; My computer is too fast to measure in milliseconds
(newline) 
(search-for-primes 1000000000 1000000021)           ;   0 ms
(search-for-primes 10000000000 10000000061)         ;   1 ms
(search-for-primes 100000000000 100000000057)       ;   3 ms 
(search-for-primes 1000000000000 1000000000063)     ;  10 ms
(search-for-primes 10000000000000 10000000000099)   ;  34 ms
(search-for-primes 100000000000000 100000000000097) ; 102 ms

; sqrt 10 is 3.16
; 1e11 -> 1 ms
; 1e12 -> 3.16 * 1ms -> 3ms
; 1e13 -> 3.16ms * 3ms -> 10ms
; 1e14 -> 3.16ms * 10ms -> 32ms (clost to 34ms)
; 1e15 -> 3.16ms * 34ms -> 107ms (close to 104ms)
;
; The results are very, very close to the expected sqrt-n order of growth.
