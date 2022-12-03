;;;; Project Euler #10
;;;; peuler010.lisp
;;;;
;;;; Izaak Walton


(in-package :peuler)

;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;;; Find the sum of all the primes below two million.

(defun numlist (x)
    (loop for i from 2 to x
        collect i))

(defvar sieve-list (numlist 1999999))

(defvar sieve-sum 0)

(defun primep (x)
    (loop for i from 2 to (sqrt x)
          if (equal (mod x i) 0)
             do (return nil)
          finally (return t)))

(defun sieve-it (numlist)
    (loop for j in numlist
        if (primep j)
            do (setq sieve-sum (+ j sieve-sum))
        finally (return sieve-sum)))

(defun peuler10 ()
  (time (sieve-it sieve-list)))

;Evaluation took:
;  5.945 seconds of real time
;  5.944691 seconds of total run time (5.944691 user, 0.000000 system)
;  100.00% CPU
;  12,555,901,186 processor cycles
;  0 bytes consed
