;;;; peuler033.lisp
;;;;
;;;;

(in-package :peuler)

;;; Fractions with digit cancelling

;;; fraction unit- (numerator denominator)
;;; 2 digit numerator, 2 digit denominator

(defun parse-digits (n)
  "Takes a number, returns a list of digits."
  (let ((numstring (write-to-string n)))
    (loop :for i :from 1 :to (length numstring)
	  :collect (parse-integer (subseq numstring (- i 1) i)))))

;(defun cancel-out (numerator denominator)
 ; (let ((num (parse-digits numerator))
;	(den (parse-digits denominator)))
 ;   (eq 3 (length (union num den)))
;	(set-difference (append num den) (union num den))
					;	nil)))

(defun avoids-zero (cancelled-list)
  (not (member 0 cancelled-list)))

(defun non-trivial (numerator denominator)
  (if (member 0 (union (parse-digits numerator)
		       (parse-digits denominator)))
      nil
      t))
(defun cancellable (numerator denominator)    
  (if (non-trivial numerator denominator)
      (eq 3 (length (union (parse-digits numerator)
		           (parse-digits denominator))))
      nil))

(defun cancel-out (numerator denominator)
      (append (set-difference (parse-digits numerator) (parse-digits denominator))
	      (set-difference (parse-digits denominator) (parse-digits numerator))))

(defun simplified-p (numerator denominator)
  (if (cancellable numerator denominator)
      (let ((cancelled (cancel-out numerator denominator)))
	(equal (/ numerator denominator) (if (avoids-zero cancelled)
					     (reduce #'/ cancelled)
					     nil)))))

(defun simple-cancel-finder (denominator)
  (cond ((> denominator 99) nil)
	(t (append (loop :for i :from 11 to (- denominator 1)
		         :if (simplified-p i denominator)
			   :collect (list i denominator) :into fractions
			 :finally (return fractions))
		   (simple-cancel-finder (+ denominator 1))))))

(defun fraction-product (fraction-list)
  (list (reduce #'* (mapcar #'first fraction-list))
	(reduce #'* (mapcar #'second fraction-list))))
  
(defun peuler33 ()
  (simple-cancel-finder 13))



(defun simplify-backend (numerator denominator div)
  (cond ((< div 2) (list numerator denominator))
	((and (zerop (mod numerator div))
	      (zerop (mod denominator div)))
	 (simplify-backend (/ numerator div)
		           (/ denominator div)
		           (- div 1)))
	(t (simplify-backend numerator
		             denominator
		             (- div 1)))))

(defun simplify (fraction-pair)
  (simplify-backend (first fraction-pair) (second fraction-pair) 99))

(defun peuler33 ()
  (second (simplify (fraction-product (simple-cancel-finder 13)))))
