#lang racket
"Excersize sec.01.03.02.let"

(define (square x) (* x x))

(define (f x y) 
  ((lambda (a b)
    (+ (* x (square a)) ; this is the body of the lambda
       (* y b)
       (* a b)))
    (+ 1 (* x y)) ; this is passed as 'a' to the lambda
    (- 1 y)))     ; this is passed as 'b' to the lambda

(define (flet x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))