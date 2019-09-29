#lang racket
"Excersize 1.25"

; Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
; After all, she says, since we already know how to compute exponentials, we could have simply
; written
(define (expmod base exp m) 
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

; A: The original version of expmod avoids dealing with numbers larger than m by successively
; reducing the problem based on the property "that, for any integers x, y, and m, we can find the
; remainder of x times y modulo m by computing separately the remainders of x modulo m and y modulo
; m, multiplying these, and then taking the remainder of the result modulo m."
; 
; "For instance, in the case where e is even, we compute the remainder of b^e/2 modulo m, square
; this, and take the remainder modulo m. This technique is useful because it means we can perform
; our computation without ever having to deal with numbers much larger than m."
;
; Thus the original expmod avoids massive numbers, while Alissa P. Hacker's expmod causes the
; interpreter to find remainders for enormous numbers. Alissa P. Hacker's expmod will therefore
; be much slower.
