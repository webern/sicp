#lang racket
"Excersize 1.14"

; Exercise 1.14: 


; this function takes the amount to make change for as 'amount'. The number of types of coins is
; hardcoded at 5, and those denominations are hard-coded as 1, 5, 10, 25 and 50.
(define (count-change amount) (cc amount 5))

; cc is a recursive function that returns the number of ways to make change for a given amount.
; kinds-of-coins represents the number of coin denominations. these will always be, in order, from
; the denominations of penny (if 1), pennies and nickels (if 2), etc.
(define (cc amount kinds-of-coins)

  ; base case: of the amount is zero, then there is exactly 1 way to make change (return no coins)
  (cond ((= amount 0) 1)

        ; base case: if the amount is less than zero, then there is no way to make correct change
        ((or (< amount 0) (= kinds-of-coins 0)) 0)

        ; add    the number of ways to make change without the largest denomination of coin
        (else (+ (cc amount
                     (- kinds-of-coins 1))

                 ; the number of ways to make change for the amount less the largest available coin
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))

; takes the number of coin denominations, and returns the largest valued coin for that set of
; denominations. for example, if we have pennies, nickels and dimes, this function takes 3
; and returns the value of a dime.
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
