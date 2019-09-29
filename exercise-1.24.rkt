#lang racket
"Excersize 1.24"

(#%require (lib "27.ss" "srfi"))

; Exercise 1.24: Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the
; Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test
; has Θ(log n) growth, how would you expect the time to test primes near 1,000,000 to compare with
; the time needed to test primes near 1000? Do your data bear this out? Can you explain any
; discrepancy you find?

; Expected growth for each order of magniture is log2(10) => 3.3
; So we should expect a linear increase in time for each order-of-magnitude increase

(define (square x) (* x x))


(define (expmod base exp m) 
  (cond ((= exp 0) 1)
        ((even? exp)
           (remainder
           (square (expmod base (/ exp 2) m))
            m)) 
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
             m))))



(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false)))

; (define (smallest-divisor n) (find-divisor n 2))

; (define (find-divisor n current)
;     (cond ((> (square current) n) n)
;           ((divides? current n) current)
;           (else (find-divisor n (+ current 1)))))

; (define (divides? a b) (= (remainder b a) 0))

; (define (prime? n) (= n (smallest-divisor n)))

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 10) (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)  
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start stop)
  (define (my-iter current)
    (timed-prime-test current)
    (cond ((<= current stop) (my-iter (+ current 1)))))
  (my-iter start))

(newline)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003)
(timed-prime-test 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001323)

; Conclusion: my machine is too fast to make meaningful observations on the time complexity of
; fast-prime. I think the runtime is probably dominated by the handling of massive integers.
