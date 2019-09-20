#lang racket
"let"

; let with one binding
(let ((x 10))
  (+ x 3))

; let with multiple bindings
(let ((x 10)
      (y 20)
      (z 20))
  (+ x y z))

; let with compound thingies
(let ((x (remainder 10 3))
      (y (+ 1 1))
      (z (+ 2 (remainder 1 2))))
  (+ x y z))

