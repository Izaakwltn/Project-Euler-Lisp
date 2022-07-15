;;;; peuler032.lisp
;;;;
;;;;

(in-package :peuler)

(defun parse-digits (n)
  "Takes a number, returns a list of digits."
  (let ((numstring (write-to-string n)))
    (loop :for i :from 1 :to (length numstring)
	  :collect (parse-integer (subseq numstring (- i 1) i)))))

(defun pandigital-p (x y)
  "Checks whether the multiplier, multiplicand, and product are pandigital."
  (equal (sort (append (parse-digits x)
		       (parse-digits y)
		       (parse-digits (* x y)))
	       #'<)
	 '(1 2 3 4 5 6 7 8 9)))

(defun pandigital-search (i)
  (cond ((> i 1999) nil)
	(t (append (loop :for j :from 1 :to 1999
				 :if (pandigital-p i j)
				   :collect (* i j) :into pan-products
			  :finally (return pan-products))
		    (pandigital-search (+ i 1))))))

(defun peuler32 ()
  (reduce #'+ (remove-duplicates (pandigital-search 1))))
