;;;; peuler037.lisp
;;;;
;;;;

(in-package :peuler)

;;; Truncatable primes

;;; 3797 -> 797 -> 97 -> 7 all primes, also 379 -> 37 -> 3

;;; There are exactly 11 of these

(defun is-prime (n)
  (if (equal n 1)
      nil
      (loop :for i :from 2 to (sqrt n)
	    :if (zerop (mod n i))
	      :do (return nil)
	    :finally (return t))))

(defun truncatable-backend (numstring)
  (cond ((zerop (length numstring)) t)
	((is-prime (parse-integer numstring))
	 (truncatable-backend (subseq numstring 1)))
	(t nil)))

(defun truncatable-p (n)
  (truncatable-backend (write-to-string n)))

(defun reverse-truncatable-backend (numstring)
  (cond ((zerop (length numstring)) t)
	((is-prime (parse-integer numstring))
	 (reverse-truncatable-backend (subseq numstring 0
					      (- (length numstring) 1))))
	(t nil)))

(defun reverse-truncatable-p (n)
  (reverse-truncatable-backend (write-to-string n)))

(defun truncatable-search (n count)
  (cond ((> count 10) nil)
	((and (truncatable-p n)
	      (reverse-truncatable-p n))
	 (cons n (truncatable-search (+ n 1) (+ count 1))))
	(t (truncatable-search (+ n 1) count))))

(defun peuler37 ()
  (reduce #'+ (truncatable-search 11 0)))
