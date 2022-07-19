;;;; Project Euler #23
;;;; peuler023.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

  (defun abund-sums (abund-list)
    (loop for i in abund-list
	do (loop for j in abund-list
	     if (< (+ i j) 20161)
               collect (+ i j) into ab-sums
		 finally (setq abundant-sums (union ab-sums abundant-sums)))))
  
 (defun abund-list-generator (min max)
  (loop for i from min to max
	if (abundant-p i)
	  collect i into abund-list
	finally (return abund-list)))

 (defun peuler23 ()
   (defvar abundant-sums '(24))
   (abund-sums (abund-list-generator 1 20161))
   (reduce #'+ (set-difference (num-list 20161) abundant-sums)))
