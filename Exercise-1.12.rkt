#lang racket
"Excersize 1.12"

; Exercise 1.12: The following pattern of numbers is called Pascal’s triangle.
;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1


(define (pascal row col)
  (cond ((= col 0) 1)
        ((< col 0) 0)
        ((= col row) 1)
        ((> col row) 0)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

"row 0"
(pascal 0 0)

"row 2"
(pascal 1 0)
(pascal 1 1)

"row 2"
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)

"row 3"
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)

"row 4"
(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)
