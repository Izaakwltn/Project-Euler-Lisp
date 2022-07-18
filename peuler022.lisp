;;;; peuler022.lisp
;;;;
;;;;

(in-package :peuler)

;;;names scores
;;; parse names from txt file into names list
;;; alphabetical sort

;;;calculate alphabetical value for each name

(defun scrape-name-file ()
  (uiop:read-file-string (asdf:system-relative-pathname "peuler" "p022_names.txt")))


(defun parse-names (scraped-names) ;format "name","name"
  (loop :with current-name := ""
	:with name-list := nil

	:for i :from 1 :to (length scraped-names)
	:if (string-equal (subseq scraped-names (- i 1) i) ",")
	  :do (setq current-name "")
	:if (and (string-equal (subseq scraped-names (- i 1) i) "\"")
	         (not (string-equal current-name "")))
	  :do (progn (setq name-list (cons current-name name-list))
		     (setq current-name ""))
	:else :if (string-equal (subseq scraped-names (- i 1) i) "\"")
		:do (setq current-name "")
	:else :if (string-equal (subseq scraped-names (- i 1) i) ",")
		:do (setq current-name "")
	:else :do (setq current-name (concatenate 'string
						  current-name
						  (subseq scraped-names (- i 1) i)))
	:finally (return (sort (copy-list name-list) #'string<))))

(setq letter-scores '(("A" 1)
			("B" 2)
			("C" 3)
			("D" 4)
			("E" 5)
			("F" 6)
			("G" 7)
			("H" 8)
			("I" 9)
			("J" 10)
			("K" 11)
			("L" 12)
			("M" 13)
			("N" 14)
			("O" 15)
			("P" 16)
			("Q" 17)
			("R" 18)
			("S" 19)
			("T" 20)
			("U" 21)
			("V" 22)
			("W" 23)
			("X" 24)
			("Y" 25)
			("Z" 26)))

(defun letter-score (letter)
  (second (find-if #'(lambda (i)
		       (string-equal (first i) letter))
	           letter-scores)))
  
(defun parse-letters (name)
  (cond ((string-equal name "") nil)
	(t (cons (subseq name 0 1)
		 (parse-letters (subseq name 1))))))

(defun alphabet-score (name)
  (loop :for i :in (parse-letters name)
	:sum (letter-score i) :into alphabet-score
	:finally (return alphabet-score)))

(defun scored-names (name-list)
  (mapcar #'alphabet-score name-list))

(defun alphabet-tally-backend (scored-list n)
  (cond ((null scored-list) 0)
	(t (+ (* n (first scored-list))
	      (alphabet-tally-backend
	       (rest scored-list) (+ n 1))))))

(defun alphabet-tally (name-list)
  (alphabet-tally-backend name-list 1))

(defun peuler22 ()
  (alphabet-tally (scored-names (parse-names (scrape-name-file)))))

