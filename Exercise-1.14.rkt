#lang racket
"Excersize 1.14"

; Exercise 1.14: 


; this function takes the amount to make change for as 'amount'. The number of types of coins is
; hardcoded at 5, and those denominations are hardcoded as 1, 5, 10, 25 and 50.
(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))

; takes the number of coin denominations, and returns the largest valued coin for that set of
; denominations. for example, if we have pennies, nickles and dimes, this function takes 3
; and returns the value of a dime.
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
