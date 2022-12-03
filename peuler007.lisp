;;;; Project Euler # 7
;;;; peuler007.lisp
;;;;
;;;; Copyright Izaak Walton (c) 2022

(in-package :peuler)

;;; By listing the first six prime numbers: 
;;; 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

;;; What is the 10,001st prime number?

(defun primep (n)
  (loop for i from 2 to (sqrt n)
	if (zerop (mod n i))
	  do (return nil)
	finally (return t)))

(defun prime-ladder (n counter)
  (cond ((equal counter 10001) (- n 1))
	((primep n) (prime-ladder (+ n 1) (+ counter 1)))
	(t (prime-ladder (+ n 1) counter))))

(defun peuler7 ()
  (time (prime-ladder 2 0)))

;Evaluation took:
 ; 0.128 seconds of real time
  ;0.128276 seconds of total run time (0.128276 user, 0.000000 system)
  ;100.00% CPU
  ;270,922,564 processor cycles
  ;0 bytes consed

;;; Old Version

(defvar prime-list '(2 3 5 7))

(defun old-primep (n)
    (every #'(lambda (prime)
               (not (equal (mod n prime) 0)))
	   prime-list))

(defun prime-finder (n)
    (cond ((equal (length prime-list) 10001) (first prime-list))
          ((old-primep n) (progn (setq prime-list (cons n prime-list))
                             (prime-finder (+ n 2))))
          (t (prime-finder(+ n 2)))))

(defun old-peuler7 ()
    (setq prime-list '(2 3 5 7))
  (time (prime-finder 11)))

;Evaluation took:
;  5.804 seconds of real time
 ; 5.802979 seconds of total run time (5.802979 user, 0.000000 system)
 ; 99.98% CPU
 ; 12,256,466,802 processor cycles
 ; 163,840 bytes consed
