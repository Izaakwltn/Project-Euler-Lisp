;;;;------------------------------------------------------------------------
;;;;Project Euler # 5
;;;;------------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;;2520 is the smallest number that can be divided by each of the numbers 
;;;from 1 to 10 without any remainder.

;;;What is the smallest positive number that is evenly divisible by 
;;;all of the numbers from 1 to 20?
;;;;------------------------------------------------------------------------

(defun divisiblep (n cap)
    (cond ((equal cap 1) t)
          ((not (equal (mod n cap) 0)) nil)
          (t (divisiblep n (- cap 1)))))

(defun div-check (n cap)
    "Finds the smallest number that is divisible by all numbers under cap."
    (cond ((divisiblep n cap) n)
          (t (div-check (+ n 1) cap))))

(defun peuler5 ()
  (time (div-check 1 20)))

;Evaluation took:
;  5.763 seconds of real time
;  5.760383 seconds of total run time (5.720821 user, 0.039562 system)
;  99.95% CPU
;  12,171,992,146 processor cycles
;  0 bytes consed

;;;;------------------------------------------------------------------------
