;;;; Project Euler # 12
;;;; peuler012.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; The sequence of triangle numbers is generated by 
;;; adding the natural numbers. So the 7th triangle number would be 
;;; 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

;;; 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

;;; Let us list the factors of the first seven triangle numbers:

 ;    1: 1
  ;   3: 1,3
  ;   6: 1,2,3,6
  ;  10: 1,2,5,10
   ; 15: 1,3,5,15
  ;  21: 1,3,7,21
  ;  28: 1,2,4,7,14,28

;;; We can see that 28 is the first triangle number to have over five divisors.

;;; What is the value of the first triangle number to have over five hundred divisors?

(defun factor-tally (n)
    (loop for i from 1 to (sqrt n)
        if (equal (mod n i) 0)
            count i into factors
        finally (return (* 2 factors))))


(defun tri-set (tri-num n) 
    (cond ((> (factor-tally tri-num) 500) tri-num)
          (t (tri-set (+ tri-num n) (+ n 1)))))

(defun peuler12 ()
  (time (tri-set 0 1)))

;Evaluation took:
;  1.827 seconds of real time
;  1.826601 seconds of total run time (1.826601 user, 0.000000 system)
;  100.00% CPU
;  3,857,926,834 processor cycles
;  0 bytes consed
