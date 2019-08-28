#lang racket
"Excersize 1.10"

; Exercise 1.10: e following procedure computes a math- ematical function called Ackermann’s
; function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; What are the values of the following expressions?

"(A 1 10)"
(A 1 10)
"(A 2 4)"
(A 2 4)
"(A 3 3)"
(A 3 3)
"(A 1 1)"
(A 1 1)
"(A 1 2)"
(A 1 2)
"(A 1 3)"
(A 1 3)
"(A 1 1)"
(A 1 1)
"(A 2 1)"
(A 2 1)
"(A 3 1)"
(A 3 1)

; Expansion pattern for (A 1 10)
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024

(define (f n) (A 0 n))
(define (g n) (A 1 n)) 
(define (h n) (A 2 n)) 
(define (k n) (* 5 n n))

; Give concise mathematical definitions for the functions com- puted by the procedures f, g, and h
; for positive integer values of n. For example, (k n) computes 5n2.

"(f 1)"
(f 1)
"(f 2)"
(f 2)
"(f 3)"
(f 3)
"(f 4)"
(f 4)
"(f n) computes 2n"

"(g 1)"
(g 1)
"(g 2)"
(g 2)
"(g 3)"
(g 3)
"(g 4)"
(g 4)
"(g n) compuntes 2^n"


"(h 1)"
(h 1)
"(h 2)"
(h 2)
"(h 3)"
(h 3)
"(h 4)"
(h 4)
"(h n) compuntes 2^2^n (i.e. 2 raised to 2 raised to the n)"
