#lang racket

; Exercise 1.7

(define (abs x) ((if (< x 0) - +) x))
(define (square x) (* x x))
(square -2)

(define (good-enough-v1? guess x)
  (< (abs (- (square guess) x )) 0.001))

"test (good-enough-v1? 3 9)"
(good-enough-v1? 3 9)

"test (good-enough-v1? 2 9)"
(good-enough-v1? 2 9)

(define (average a b)
  (/ (+ a b) 2))

"test (average 3.0 4.0)"
(average 3.0 4.0)

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter-v1 guess x)
  (if (good-enough-v1? guess x)
      guess
      (sqrt-iter-v1 (improve guess x)
                 x)))

(define (sqrt-v1 x)
  (sqrt-iter-v1 1.0 x))

; Exercise 1.7: The good-enough? test used in computing square roots will not be
; very effective for finding the square roots of very small numbers. Also, in real
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain these
; statements, with examples showing how the test fails for small and large numbers.

; An alterna-tive strategy for implementing good-enough? is to watch how guess
; changes from one iteration to the next and to stop when the change is a very
; small fraction of the guess. Design a square-root procedure that uses this
; kind of end test. Does this work better for small and large numbers?

"------------------"
"test (sqrt-v1 9.0)"
(sqrt-v1 9.0)

"------------------"
"test (sqrt-v1 9.0)"
(sqrt-v1 9.0)

"------------------"
"test (sqrt-v1 0.00000025) ... Should be 0.0005"
(sqrt-v1 0.00000025)

"--------------------------------------------------"
"test (sqrt-v1 899413243876.0) ... Should be 948374"
(sqrt-v1 899413243876)

"------------------------------------------------------"
"sqrt-v1 does not work well for small and large numbers"

(define (diff-percent a b)
  (/ (abs(- a b)) a))

"-------------------------------"
"test (diff-percent 100.0 101.0)"
(diff-percent 100.0 101.0)

(define (good-enough-v2? current-guess next-guess)
  (< (diff-percent current-guess next-guess) 0.00001))

(define (sqrt-iter-v2 guess x)
  (if (good-enough-v2? guess (improve guess x))
      guess
      (sqrt-iter-v2 (improve guess x) x)))

(define (sqrt-v2 x)
  (sqrt-iter-v2 1.0 x))

"----------------------------------------------"
"test (sqrt-v2 0.00000025) ... Should be 0.0005"
(sqrt-v2 0.00000025)

"--------------------------------------------------"
"test (sqrt-v2 899413243876.0) ... Should be 948374"
(sqrt-v2 899413243876)

"--------------------------------------------------------"
"sqrt-v2 works better than v1 for large and small numbers"