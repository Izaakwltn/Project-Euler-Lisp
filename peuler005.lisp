;;;; Project Euler #5
;;;; peuler005.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; 2520 is the smallest number that can be divided by each of the numbers 
;;; from 1 to 10 without any remainder.

;;; What is the smallest positive number that is evenly divisible by 
;;; all of the numbers from 1 to 20?

(defun slower-twenty-divisible-p (n) ;8 tenths of a second slower)
  (loop :for i :from 20 :downto 1
	:if (not (zerop (mod n i)))
	  :do (return nil)
	:finally (return t)))

(defun twenty-divisible-p (n cap)
    (cond ((equal cap 1) t)
          ((not (equal (mod n cap) 0)) nil)
          (t (twenty-divisible-p n (- cap 1)))))

(defun div-check (n)
    "Finds the smallest number that is divisible by all numbers under cap."
    (cond ((twenty-divisible-p n 20) n)
          (t (div-check (+ n 1)))))

(defun peuler5 ()
  (time (div-check 1)))



;;; slow version
(defun slower-twenty-divisible-p (n) ;8 tenths of a second slower)
  (loop :for i :from 20 :downto 1
	:if (not (zerop (mod n i)))
	  :do (return nil)
	:finally (return t)))
