;;;;-------------------------------------------------------------------------
;;;;Project Euler #15
;;;;-------------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;;Starting in the top left corner of a 2×2 grid, 
;;;and only being able to move to the right and down, 
;;;there are exactly 6 routes to the bottom right corner.

;;;How many such routes are there through a 20×20 grid?
;;;;-------------------------------------------------------------------------

(defun fact (n)
        (cond ((zerop n) 1)
              (t (* n (fact (- n 1))))))

(defun combinatoric-route(n)
    (/ (fact (* 2 n))
       (* (fact n) (fact n))))

(defun peuler15 ()
  (time (combinatoric-route 20)))

;Evaluation took:
;  0.000 seconds of real time
;  0.000025 seconds of total run time (0.000025 user, 0.000000 system)
;  100.00% CPU
;  46,616 processor cycles
;  0 bytes consed

;;;;-------------------------------------------------------------------------
