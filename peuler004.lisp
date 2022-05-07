;;;;-----------------------------------------------------------------------
;;;;Project Euler # 4
;;;;-----------------------------------------------------------------------

(in-package :peuler)

;;;;-----------------------------------------------------------------------
;;;A palindromic number reads the same both ways. 
;;;The largest palindrome made from 
;;;the product of two 2-digit numbers is 9009 = 91 × 99.

;;;Find the largest palindrome made from the product of two 3-digit numbers.
;;;;-----------------------------------------------------------------------

(defvar big-palindrome 10201)

(defun palindromep (n)
    (equal (write-to-string n) (reverse (write-to-string n))))

(defun three-digit-internal (n m)
  (cond ((equal m 100) (three-digit-multiplier (- n 1)))
	((and (palindromep (* n m))
	      (> (* n m) big-palindrome))
	 (progn (setq big-palindrome (* n m))
                (three-digit-internal n (- m 1))))
             (t (three-digit-internal n (- m 1)))))

(defun three-digit-multiplier (n)
       (cond ((equal n 100) big-palindrome)
             (t (three-digit-internal n 999))))

(defun peuler4 ()
    (setq big-palindrome 10201)
    (time (three-digit-multiplier 999)))

;Evaluation took:
;  0.440 seconds of real time
;  0.440853 seconds of total run time (0.440658 user, 0.000195 system)
;  [ Run times consist of 0.015 seconds GC time, and 0.426 seconds non-GC time. ]
;  100.23% CPU
;  929,069,286 processor cycles
;  103,432,848 bytes consed
;;;;-----------------------------------------------------------------------
