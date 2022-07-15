;;;; peuler035.lisp
;;;;
;;;;

(in-package :peuler)

;;; circular primes (197 971 719) all rotations are prime

(defun rotate-num (n)
  (let ((numstring (write-to-string n)))
    (mapcar #'parse-integer (loop :with num := numstring
                                  :for i :from 1 :to (length numstring)
	                          :collect num :into rotations
	                          :do (setq num (concatenate 'string (subseq num 1) (subseq num 0 1)))
				  :finally (return rotations)))))

(defun circular-prime-p (n)
  (if (member nil (mapcar #'primep (rotate-num n)))
      nil
      t))

(defun circular-prime-search ()
  (loop :with tally := 0

	:for i :from 2 :to 999999
	:if (circular-prime-p i)
	  :do (setq tally (+ tally 1))
	:finally (return tally)))

(defun peuler35 ()
  (circular-prime-search))




