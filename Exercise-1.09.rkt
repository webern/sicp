#lang racket

; Exercise 1.9: Each of the following two procedures defines a method for adding two positive
; integers in terms of the procedures inc, which increments its argument by 1, and dec, which
; decrements its argument by 1.

"Excersize 1.9"

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus-v1 a b)
  (if (= a 0) 
      b 
      (inc (plus-v1 (dec a) b))))

(define (plus-v2 a b)
  (if (= a 0) 
       b 
       (plus-v2 (dec a) (inc b))))

"test (plus-v1 100000000 1)"
(current-seconds)
(plus-v1 100000000 1)
(current-seconds)
"plus-v1 is slow"
"---------------"
"test (plus-v2 100000000 1)"
(current-seconds)
(plus-v2 100000000 1)
(current-seconds)
"plus-v2 is fast"
