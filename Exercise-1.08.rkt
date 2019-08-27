#lang racket

; Exercise 1.8: Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root
; of x , then a beer approximation is given by the value:
;
; (x/y^2 + 2y)/3
;
; rewritten to help me understand...
; (x/guess^2 + 2guess)/3
;
; Use this formula to implement a cube-root procedure anal- ogous to the square-root procedure. (In Section 1.3.4
; we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root
; procedures.)

(define (good-enough? current-guess next-guess)
  (define (var)
    (abs (- current-guess next-guess)))
  (define (diff)
    (/ (var) current-guess))
  (< (diff) 0.00001))

"test (good-enough? 1.0 1.00000001)"
(good-enough? 1.0 1.00000001)
"test (good-enough? 1.0 2.0)"
(good-enough? 1.0 2.0)

(define (square x)
  (* x x))

(define (improve guess x)
  (define (x-div-guess-sq)
    (/ x (square guess)))
  (define (x-div-guess-sq-plus-2guess)
    (+ (x-div-guess-sq) (* 2 guess)))
  (/ (x-div-guess-sq-plus-2guess) 3)) 

(define (cbrt x)
  (define (cbrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (cbrt-iter (improve guess x) x)))
  (cbrt-iter 1.0 x))

"test (cbrt 1)"
(cbrt 1)

"test (cbrt 8)"
(cbrt 8)

"test (cbrt 27)"
(cbrt 27)

"test (cbrt 64)"
(cbrt 64)

"test (cbrt 31.2) should be 3.14812..."
(cbrt 31.2)