#lang racket

; Prerequisite Definitions

(define (abs x) ((if (< x 0) - +) x))

"test (abs -1)"
(abs -1)

(define (square x) (* x x))

"test (square -2)"
(square -2)

(define (good-enough? guess x)
  (< (abs (- (square guess) x )) 0.001))

"test (good-enough? 3 9)"
(good-enough? 3 9)

"test (good-enough? 2 9)"
(good-enough? 2 9)

(define (average a b)
  (/ (+ a b) 2))

"test (average 3.0 4.0)"
(average 3.0 4.0)

(define (improve guess x)
  (average guess (/ x guess)))

"test (improve 1.9 4)"
(improve 1.8 4)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

"test (sqrt-iter 1.0 81.0)"
(sqrt-iter 1.0 81.0)

(define (sqrt x)
  (sqrt-iter 1.0 x))

"test (sqrt 9.0)"
(sqrt 9.0)

; Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to
; be provided as a special form. “Why can’t I just define it
; as an ordinary procedure in terms of cond?” she asks.
; Alyssa’s friend Eva Lu Ator claims this can indeed be done,
; and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

"test (new-if (> 1 0) 1 0 )"
(new-if (> 1 0) 1 0 )
"test (new-if (< 1 0) 1 0 )"
(new-if (< 1 0) 1 0 )

; Delighted, Alyssa uses new-if to rewrite the square-root
; program:

(define (sqrt-iter-new guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new (improve guess x)
                         x)))

(define (sqrt-new x)
  (sqrt-iter-new 1.0 x))

(sqrt-new 4)

; What happens when Alyssa uses this to compute square roots? Explain.
;
; The program ran out of memory (endless loop).
; I think this happens because the program is using applicative orde
; to evaluate both branches of the if statement, whereas the special
; form 'if' only evaluates one of the branches after determining the
; value of the conditional. Since the sqrt-iter-new else block calls
; sqrt-iter-new recursively, the applicative order evaulation can
; never terminate.