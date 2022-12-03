;;;; Project euler #38
;;;; peuler038.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; Take the number 192 and multiply it by each of 1, 2, and 3:

;;; 192 × 1 = 192
;;; 192 × 2 = 384
;;; 192 × 3 = 576

;;; By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

;;; The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

;;;What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

;;;------------------------------------------------------------------------

;;; loop from 1 to 987654320

(defun pandigital-p (numstring)
  (equal '(1 2 3 4 5 6 7 8 9)
	 (sort (loop :for i :from 1 :to (length numstring)
	             :collect (parse-integer (subseq numstring (1- i) i)))
	       #'<)))

(defun conc-product (n)
  (loop :with conc-prod := ""

	:for i :upfrom 1
	:if (>= (length conc-prod) 9)
	  :do (return conc-prod)
	:else
	  :do (setq conc-prod (concatenate 'string conc-prod (write-to-string (* n i))))))

(defun peuler038 ()
  (loop :with largest := 0

	:for i :from 1 :to 9999
	:do (let ((c (conc-product i)))
	      (if (and (pandigital-p c)
		       (> (parse-integer c) largest))
		  (setq largest (parse-integer c))))
	 :finally (return largest)))
