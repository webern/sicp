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
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
         
"(f 2)"
(f 2)
"(f 3)"
(f 3)
"(f 4)"
(f 4)
"(f 5)"
(f 5)
"(f 6)"
(f 7)

; Write a procedure that computes f by means of an iterative process.

(define (g-iter n-1 n-2 n-3 current stop)
  (if (= current stop)
      n-1
      (g-iter (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ 1 current) stop)))

(define (g n)
  (g-iter 2 1 0 2 n))

"(g 2)"
(g 2)
"(g 3)"
(g 3)
"(g 4)"
(g 4)
"(g 5)"
(g 5)
"(g 6)"
(g 7)

; Note: ouch, I used these:
; https://codology.net/post/sicp-solution-exercise-1-11/
; http://jots-jottings.blogspot.com/2011/08/sicp-111-recursive-and-iterative.html
;
; Could not solve on my own
; TODO - try again.
