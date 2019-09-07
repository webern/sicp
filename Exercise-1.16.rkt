#lang racket
"Excersize 1.16"

; Exercise 1.16: Design a procedure that evolves an itera- tive exponentiation process that uses
; successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the
; observation that (b^n/2)^2 = (b^2)^n/2, keep, along with the exponent n and the base b, an 
; additional state variable a, and define the state transformation in such a way that the product
; abn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the
; answer is given by the value of a at the end of the process. In general, the technique of defining
; an invariant quantity that remains unchanged from state to state is a powerful way to think about
; the design of iterative algorithms.)


(define (square x) (* x x))

(define (is-even? x)
  (= (remainder x 2) 0))

; this was my first attempt but I did not make use of the variable 'a' and I don't think this
; is 'iterative'.
(define (firstattempt b n a)
  (cond ((<= n 0) 1)
        ((= n 1) b)
        ((= n 2) (square b))
        ((is-even? n) (* b (firstattempt b (/ n 2) (* a 2))))
        (else (* b (firstattempt b (- n 1) (+ a 1))))))

(firstattempt 2 8 0)

; Second attempt after peeking at someone else's answer here:
; http://jots-jottings.blogspot.com/2011/09/sicp-116-iterative-exponentiation.html
; Though I still got it wrong because the iterations are still holding state...
(define (secondattempt a b n)
  (cond ((= n 0) a)
        ((is-even? n) (secondattempt (* a (square b)) b (- n 2)))
        (else (secondattempt (* a b) b (- n 1)))))

(secondattempt 1 2 4)

; This is an exact copy of the jots-jottings implementation, with a note about the base cases
(define (raise-iter a b n)
  (cond ((= n 0) a)
        ((is-even? n) (raise-iter a (square b) (/ n 2))) ; n -> 1 on the penultimate iteration 
        
        ; in an initial case where n > 1, then this causes a to equal the starting 'b'
        ; in a foma; case, where n = 1, then this 'moves' the 'answer' to a.
        ; so, if we started with an odd n, then we wait until the penultimate iteration to multiply
        ; the odd iteration. if we started with an even n, then a sill = 1 and we are just moving
        ; the answer to a.
        (else (raise-iter (* a b) b (- n 1)))))

(raise-iter 1 3 2)
(raise-iter 1 3 3)

; finally wrap the working iterative function
(define (exp base exponent)
  (raise-iter 1 base exponent))

"final tests"
"2^4"
(exp 2 4)
"3^3"
(exp 3 3)
"10^4"
(exp 10 4)
