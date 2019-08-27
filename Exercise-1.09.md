# Excersize 1.9

```
Exercise 1.9: Each of the following two procedures defines a method for adding two positive
integers in terms of the procedures inc, which increments its argument by 1, and dec, which
decrements its argument by 1.
```

## Given Functions

```Racket

(define (plus-v1 a b)
  (if (= a 0) 
      b 
      (inc (plus-v1 (dec a) b))))

(define (plus-v2 a b)
  (if (= a 0) 
      b 
      (plus-v2 (dec a) (inc b))))
```

## Evaluation of `plus-v1`

```
(plus-v1 4 5)
(inc (plus-v1 3 5))
(inc (inc (plus-v1 2 5)))
(inc (inc (inc (plus-v1 1 5))))
(inc (inc (inc (inc (plus-v1 0 5)))))
; this is a recursive process
```

## Evaluation of `plus-v2`
```
(plus-v2 4 5)
(plus-v2 3 6)
(plus-v2 2 7)
(plus-v2 1 8)
(plus-v2 0 9)
; this is an iterative process
```
