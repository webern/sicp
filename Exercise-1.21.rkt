#lang racket
"Excersize 1.21"

; Exercise 1.21: Use the smallest-divisor procedure to find the smallest divisor of each of the
; following numbers: 199, 1999, 19999.

(define (find-divisor n current)
  (cond ((>= current n) n)
        ((= (remainder n current) 0) current)
        (else (find-divisor n (+ current 1)))))

"(find-divisor 9 2)"
(find-divisor 9 2)

"(find-divisor 15 2)"
(find-divisor 15 2)

(define (smallest-divisor n) (find-divisor n 2))

"(smallest-divisor 11)"
(smallest-divisor 11)

"(smallest-divisor 199)"
(smallest-divisor 199)

"(smallest-divisor 1999)"
(smallest-divisor 1999)


"(smallest-divisor 19999)"
(smallest-divisor 19999)

