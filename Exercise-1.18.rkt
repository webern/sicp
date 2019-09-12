#lang racket
"Excersize 1.18"

; Exercise 1.18: Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
; generates an iterative process for multiplying two integers in terms of adding, doubling, and
; halving and uses a logarithmic number of steps.

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? a)
  (= 0 (remainder a 2)))

(define (mult-iter x a b)
  (cond ((= b 0) x)
        ((even? b) (mult-iter x (double a) (halve b)))
        (else (mult-iter (+ x a) a (- b 1)))))


(define (fast-mult a b)
  (mult-iter 0 a b))

(fast-mult 1 2)
(fast-mult 2 3)
(fast-mult 4 3)
(fast-mult 100 6)