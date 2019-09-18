#lang racket
"Excersize 2.01"

; 2.1.2
; Exercise 2.1: Define a better version of make-rat that handles both positive and negative
; arguments. make-rat should normalize the sign so that if the rational number is positive, both the
; numerator and denominator are positive, and if the rational number is negative, only the numerator
; is negative.

(define (make-rat-old n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer rat) (car rat))
(define (denom rat) (cdr rat))

(make-rat-old 1 2)

(let ((r (make-rat-old 5 10)))
  (numer r))

(let ((r (make-rat-old 1 2)))
  (denom r))

(define (neg? x) (< x 0))
(define (numer-neg? rat) (neg? (numer rat)))
(numer-neg? (make-rat-old -1 2))
(define (denom-neg? rat) (neg? (denom rat)))
(denom-neg? (make-rat-old -1 2))

(define (rat-neg? rat)
  (let ((nneg (numer-neg? rat))
        (dneg (denom-neg? rat)))
    (nneg)))
  ; (and (or (numer-neg? rat) (denom-neg? rat))
  ;      (not (numer-neg? rat) (denom-neg? rat))))

(rat-neg? (make-rat-old -1 2))

; (define (flet x y)
;   (let ((a (+ 1 (* x y)))
;         (b (- 1 y)))
;     (+ (* x (square a))
;        (* y b)
;        (* a b))))