;;;; peuler036.lisp
;;;;
;;;;

(in-package :peuler)
   
(defun dec-binstring-backend (n)
  (cond ((> 1 n) "")
	(t (concatenate 'string (write-to-string (mod n 2))
			(dec-binstring-backend (floor n 2))))))

(defun dec-binstring (n)
  (clear-zeroes (reverse (dec-binstring-backend n))))

(defun clear-zeroes (numstring)
  (cond ((equal (length numstring) 1)
	 numstring)
	((string-equal (subseq numstring 0 1) "1")
	 numstring)
	(t (clear-zeroes (subseq numstring 1)))))

(defun dec-palindrome-p (decstring)
  (string-equal decstring (reverse decstring)))

(defun bin-palindrome-p (binstring)
  (string-equal binstring (clear-zeroes (reverse binstring))))

(defun dual-palindrome-p (n)
  (and (dec-palindrome-p (write-to-string n))
       (bin-palindrome-p (dec-binstring n))))

(defun dual-pal-search ()
  (loop :for i :from 1 :to 999999
	:if (dual-palindrome-p i)
	  :collect i :into dual-pals
	:finally (return dual-pals)))

(defun peuler36 ()
  (reduce #'+ (dual-pal-search)))
