;;;;--------------------------------------------------------------------------
;;;;Project Euler #47
;;;;--------------------------------------------------------------------------
;;;;
(in-package :peuler)

;The first two consecutive numbers to have two distinct prime factors are:

;14 = 2 × 7
;15 = 3 × 5

;The first three consecutive numbers to have three distinct prime factors are:

;644 = 2² × 7 × 23
;645 = 3 × 5 × 43
;646 = 2 × 17 × 19.

;Find the first four consecutive integers to have four distinct prime factors each.
;What is the first of these numbers?
;;;;--------------------------------------------------------------------------


(defun primep (n)
  (loop for i from 2 to (sqrt n)
	if (zerop (mod n i))
	  do (return nil)
	finally (return t)))

(defun prime-factor-tally (n)
  (loop for i from 2 to (/ n 2)
	if (and (zerop (mod n i)) (primep i))
	  collect i into prime-factors
	finally (return (length prime-factors))))

(defun connect-four (n counter)
  (cond ((> counter 3) (- n 4))
	((equal (prime-factor-tally n) 4) (connect-four (+ n 1) (+ counter 1)))
	(t (connect-four (+ n 1) 0))))

(defun peuler47 ()
  (time (connect-four 210 0)))
;;;;--------------------------------------------------------------------------	     
