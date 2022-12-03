;;;;Project Euler #17
;;;; peuler017.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; If the numbers 1 to 5 are written out in words: 
;;; one, two, three, four, five, 
;;; then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

;;; If all the numbers from 1 to 1000 (one thousand) 
;;; inclusive were written out in words, how many letters would be used?

;;; NOTE: Do not count spaces or hyphens. 
;;; For example, 342 (three hundred and forty-two) 
;;; contains 23 letters and 115 (one hundred and fifteen) 
;;; contains 20 letters. 

;;; The use of "and" when writing out numbers is in compliance with British usage.


(defvar *single-digits* '(("1" "one")
		 	 ("2" "two")
			 ("3" "three")
			 ("4" "four")
			 ("5" "five")
			 ("6" "six")
			 ("7" "seven")
			 ("8" "eight")
			 ("9" "nine")))

(defvar *double-digits* '(("10" "ten")
                          ("11" "eleven")
                          ("12" "twelve")
                          ("13" "thirteen")
                          ("14" "fourteen")
                          ("15" "fifteen")
                          ("16" "sixteen")
                          ("17" "seventeen")
                          ("18" "eighteen")
		          ("19" "nineteen")
		          ("20" "twenty")
			  ("30" "thirty")
			  ("40" "forty")
			  ("50" "fifty")
			  ("60" "sixty")
			  ("70" "seventy")
			  ("80" "eighty")
			  ("90" "ninety")))

(defvar *other-digits* '(("2" "twenty")
			("3" "thirty")
		        ("4" "forty")
	      	        ("5" "fifty")
			("6" "sixty")
			("7" "seventy")
			("8" "eighty")
			("9" "ninety")))

(defun nth-place (n number-string)
  "finds the nth place from the end"
  (if (> n (length number-string))
      nil
      (subseq number-string (- (length number-string) n) (+ 1 (- (length number-string) n)))))

(defun single-digit (numstr) ;-> str
  (second (find-if #'(lambda (x)
		       (string-equal numstr
				     (first x)))
		   *single-digits*)))

(defun double-digit (numstr) ;-> str name
  (if (find-if #'(lambda (x)
		   (string-equal numstr
				 (first x)))
	       *double-digits*)
      (second (find-if #'(lambda (x)
			   (string-equal numstr
					 (first x)))
		       *double-digits*))
      (concatenate 'string
		   (second (find-if #'(lambda (x)
				(string-equal (nth-place 2 numstr)
				              (first x)))
			        *other-digits*))
		   (single-digit (nth-place 1 numstr)))))

(defun triple-digit (numstr)
  (cond ((and (string-equal "0" (nth-place 1 numstr))
	      (string-equal "0" (nth-place 2 numstr)))
	 (concatenate 'string
		      (second (find-if #'(lambda (x)
					     (string-equal (nth-place 3 numstr)
							   (first x)))
					 *single-digits*))
		      "hundred"))
	((string-equal "0" (nth-place 2 numstr))
	 (concatenate 'string
		      (second (find-if #'(lambda (x)
					     (string-equal (nth-place 3 numstr)
							   (first x)))
					 *single-digits*))
		      "hundredand"
		      (single-digit (nth-place 1 numstr))))
	(t (concatenate 'string
		        (second (find-if #'(lambda (x)
					     (string-equal (nth-place 3 numstr)
							   (first x)))
					 *single-digits*))
			"hundredand"
			(double-digit (subseq numstr 1))))))

(defun number-to-words (n)
  (let ((s (write-to-string n)))
    (cond ((> (length s) 3) "")
	  ((> (length s) 2) (triple-digit s))
	  ((> (length s) 1) (double-digit s))
	  (t (single-digit s)))))

(defun peuler17-backend (n)
  (cond ((> n 999) "onethousand")
	(t (concatenate 'string
			(number-to-words n)
			(peuler17-backend (+ n 1))))))
			
(defun peuler17 ()
  (time (length (peuler17-backend 1))))

