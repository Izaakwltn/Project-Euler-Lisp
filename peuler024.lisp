;;;; Project Euler #24
;;;; peuler024.lisp
;;;;
;;;; Izaak Walton


(in-package :peuler)

;;; A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

;;; 012   021   102   120   201   210

;;; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

(defun string-to-list (numstring)
  "Converts a string of numbers to a list of integers."
  (cond ((equal numstring "") nil)
	(t (cons (parse-integer (subseq numstring 0 1))
		 (string-to-list (subseq numstring 1))))))

(defun list-to-string (numlist)
  "Converts a list of integers to a numberstring."
  (cond ((null numlist) "")
	(t (concatenate 'string (write-to-string (first numlist))
			(list-to-string (rest numlist))))))

(defun digit-swap (numstring nth mth)
  "Takes a number string and two digit places, swaps them."
  (concatenate 'string
	       (subseq numstring 0 nth)
	       (subseq numstring mth (+ mth 1))
	       (if (> (- mth nth) 1)
		   (subseq numstring (+ nth 1) (- mth 1))
		   "")
	       (subseq numstring nth (+ nth 1))
	       (subseq numstring (+ mth 1) (length numstring))))

;0 1 2, 0 2 1, 
(defun permutation-backend (rev-numlist nth-value mth-value)
  (cond ((null numlist) (list nth-value mth-value))
	((> (second numlist) (first numlist))
	 (

(defun permutate (numlist)
  "Takes a list of numbers and makes the next lexicographic permutation."
  (permutation-backend (reverse numlist))
	  
