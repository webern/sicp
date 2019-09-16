#lang racket
"Excersize 1.20"

; Exercise 1.20: The process that a procedure generates is of course dependent on the rules used by
; the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were
; to interpret this procedure using normal-order evaluation, as discussed in Section 1.1.5. (The
; normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method
; (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the
; remainder operations that are actually performed. How many remainder operations are actually
; performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?

(define (gcd a b) 
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

; Note: we must use the 'special form if' or else this is infinitely recursive in Normal Order
; From Section 1.1.16
;... form if, a restricted type of conditional that can be used when there are precisely two cases
; in the case analysis. Thee general form of an if expression is
; (if ⟨predicate⟩ ⟨consequent⟩ ⟨alternative⟩)
; To evaluate an if expression, the interpreter starts by evaluating the ⟨predicate⟩ part of the
; expression. If the ⟨predicate⟩ evaluates to a true value, the interpreter then evaluates the
; ⟨consequent⟩ and returns its value. Otherwise it evaluates the ⟨alternative⟩ and returns its
; value.

; Normal Order
(if (= 40 0)
    40
    (gcd 40 (remainder 206 40)));

; ->

(gcd 40 (remainder 206 40))

; ->

(if (= 40 0) ; remainder has been resolved ONCE here                                               1
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; ->

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; ->

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

; ->

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

; ->

(if (= 4 0) ; remainder has been resolved TWICE here                                               2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

; ->

(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

; ->

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
         (remainder (remainder 40 (remainder 206 40)) 
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; ->

(if (= 2 0) ; remainder has been resolved FOUR TIMES here
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
         (remainder (remainder 40 (remainder 206 40)) 
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))


; ->

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
     (remainder (remainder 40 (remainder 206 40)) 
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;

(if (= (remainder (remainder 40 (remainder 206 40)) 
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) 
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
                    (remainder (remainder 40 (remainder 206 40)) 
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;

(if (= 0 0) ; remainder has been resolved 7 TIMES here                                             7
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) 
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 
                    (remainder (remainder 40 (remainder 206 40)) 
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

;

2 ; remainder has been resolved 4 times here.                                                      4

; total calls to remainder: 1 + 2 + 4 + 7 + 4 = 18 times


; Applicative Order
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
; remainder is called 4 times

