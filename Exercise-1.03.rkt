#lang racket

; Exercise 1.3: Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the
; two larger numbers.

(define (max a b) (cond ((> a b) a)
                        (else b)))

(define (remove_smallest a b c)
  (cond ((and (>= a b) (>= b c)) (list a b))
        ((and (>= a b) (>= c b)) (list a c))
        (else (list b c))))

; test remove_smallest
(remove_smallest 1 2 3)
(remove_smallest 3 2 1)
(remove_smallest 3 1 2)

(define (square a) (* a a))
(define (sum_squares a b)
  (+ (square a) (square b)))

; test sum_squares
(sum_squares 2 3)

(define (sum_square_largest_two a b c)
  (apply sum_squares (remove_smallest a b c)))

; test sum_square_largest_two
(sum_square_largest_two 1 2 3) #! 2sq + 3sq = 13
(sum_square_largest_two -1 -2 -3) #! 5
