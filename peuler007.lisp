;;;;-------------------------------------------------------------------------
;;;;Project Euler # 7
;;;;-------------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;;;By listing the first six prime numbers: 
;;;;2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

;;;;What is the 10,001st prime number?

;;;;-------------------------------------------------------------------------
(defun primep (n)
  (loop for i from 2 to (sqrt n)
	if (zerop (mod n i))
	  do (return nil)
	finally (return t)))

(defun prime-ladder (n counter)
  (cond ((equal counter 10001) n)
	((primep n) (prime-ladder (+ n 1) (+ counter 1)))
	(t (prime-ladder (+ n 1) counter))))

(defun peuler7 ()
  (prime-ladder 2 0))
  

;;;;------------------------------------------------------------------------
;;;Old Version

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
    (prime-finder 11))

;;;;-------------------------------------------------------------------------
