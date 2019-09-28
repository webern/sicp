#lang racket
"Excersize 1.23"


; Exercise 1.23: The smallest-divisor procedure shown at the start of this section does lots of
; needless testing: After it checks to see if the number is divisible by 2 there is no point in
; checking to see if it is divisible by any larger even num- bers. This suggests that the values
; used for test-divisor should not be 2, 3, 4, 5, 6, . . ., but rather 2, 3, 5, 7, 9, . . ..
;
; To implement this change, define a procedure next that returns 3 if its input is equal to 2 and
; otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-
; divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version
; of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this
; modification halves the number of test steps, you should expect it to run about twice as fast. Is
; this expectation confirmed? If not, what is the observed ratio of the speeds of the two
; algorithms, and how do you explain the fact that it is different from 2?

(define (square x) (* x x))

(define (smallest-divisor-v1 n) (find-divisor-v1 n 2))
 
(define (find-divisor-v1 n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-v1 n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (runtime) (current-milliseconds))

(define (start-timed-function start-time func input)
  (let ((result (func input)))
  (report-time (- (runtime) start-time) input result)))

(define (report-time elapsed-time input output)  
  (display "input: ")
  (display input)
  (display ", output: ")
  (display output)
  (display " *** ")
  (display elapsed-time)
  (display " ms"))

(display "test: (start-timed-function (runtime) smallest-divisor-v1 100039)")
(newline)
(start-timed-function (runtime) smallest-divisor-v1 100039)
(newline)
(newline)

(define (next-test current)
  (if (= current 2)
      (+ current 1)
      (+ current 2)))

(define (find-divisor-v2 n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-v2 n (next-test test-divisor)))))

(define (smallest-divisor-v2 n) (find-divisor-v2 n 2))

(display "test: (start-timed-function (runtime) smallest-divisor-v2 100039)")
(newline)
(start-timed-function (runtime) smallest-divisor-v2 100039)
(newline)
(newline)

(display "-----------------------------------------------------------------")
(newline)
(display "-- slower version")
(newline)
(display "-----------------------------------------------------------------")
(newline)

(start-timed-function (runtime) smallest-divisor-v1 100000000000097)



(newline)
(newline)
(display "-----------------------------------------------------------------")
(newline)
(display "-- faster version")
(newline)
(display "-----------------------------------------------------------------")
(newline)

(start-timed-function (runtime) smallest-divisor-v2 100000000000097)

(newline)
(newline)

; conclusion 54ms vs 123ms, approximately twice as fast, as expected

