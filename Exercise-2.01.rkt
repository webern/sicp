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

; corrects signs and does gcd
(define (make-rat n d)
  (define (flip-numer n d) ; change numerator if necessary due to sign
    (cond 
      ((and (< n 0) (< d 0)) (* -1 n))
      ((and (< n 0) (> d 0)) n)
      ((and (> n 0) (< d 0)) (* -1 n))
      (else n)))
  (define (flip-denom d) ; change denominator if necessary due to sign
    (if (< d 0)
        (* -1 d)
        d))
  (let ((g (gcd n d))
        (numer (flip-numer n d))
        (denom (flip-denom d)))
    (cons (/ numer g) (/ denom g))))

"(make-rat -2 -2) should print (1 . 1)"
(make-rat -2 -2)

"(make-rat -21 7) should print (-3 . 1)"
(make-rat -21 7)

"(make-rat 13 -26) should print (-1 . 2)"
(make-rat 13 -26)

"(make-rat 100 1000) should print (1 . 10)"
(make-rat 100 1000)
