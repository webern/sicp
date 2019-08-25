#lang racket

; Exercise 1.4: Observe that our model of evaluation allows for combinations
; whose operators are compound expres- sions. Use this observation to
; describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b  10 -10) #! 20
(a-plus-abs-b -10 -10) #! 0

; Wow, that's cool. The operator + vs - is returned based on whether or
; not b is negative.
