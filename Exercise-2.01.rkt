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

; (define (simple-and n d)
;   (and (< n 0) (< d 0)))

; (and thing1 thing2)

; ()

; (or (< n 0) (< d 0))

; takes a numerator and denominator and returns the correct numerator adjusting for sign
(define (flip-numer n d)
  (cond 
    ((and (< n 0) (< d 0)) (* -1 n))
    ((and (< n 0) (> d 0)) n)
    ((and (> n 0) (< d 0)) (* -1 n))
    (else n))
)

; takes a numerator and denominator and returns the correct denominator adjusting for sign
(define (flip-denom n d)
  (if (< d 0)
      (* -1 d)
      d))

(flip-denom -1 -2)
(flip-denom 1 2)
(flip-denom -1 2)
(flip-denom 1 -2)

; (define (make-rat-new n d)
;   (let ((numer (cond 
;                  (((and (< n 0) (< d 0)) n))
;                  (((or (< n 0) (< d 0) (* -1 n))))
;                  (else n)))
;        (g (gcd n d))))
;     (cons (/ n g) (/ d g)))