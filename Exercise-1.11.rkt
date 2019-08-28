#lang racket
"Excersize 1.11"

; Exercise 1.11: A function f is defined by the rule that 
; f(n) = n if n<3
; f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3.

; Write a procedure that computes f by means of a recursive process.

(define (f n) 
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2))
         (* 3 (f (- n 3)))))))

"(f 3)"
(f 3)
"(f 4)"
(f 4)
"(f 5)"
(f 5)

; Write a procedure that computes f by means of an iterative process.

(define (the-func a b c)
  (+ a (* 2 b) (* 3 c)))

(define (g-iter a b c)
  (if (< a 3)
      a
      (g-iter (the-func a b c)
              a
              b)))

(define (g n)
  (g-iter n (- n 1) (- n 2)))

"(g 3)"
(g 3)
"(g 4)"
(g 4)
"(g 5)"
(g 5)