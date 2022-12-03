;;;; Project Euler # 1
;;;; peuler001.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; If we list all the natural numbers below 10 that are multiples of 3 or 5, 
;;; we get 3, 5, 6 and 9. The sum of these multiples is 23.

;;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun peuler1 ()
  (time (loop :for i :from 1 :to 999
	      :if (or (zerop (mod i 3))
	              (zerop (mod i 5)))
		:sum i)))


					;Evaluation took:
					; 0.000 seconds of real time
					; 0.000083 seconds of total run time (0.000078 user, 0.000005 system)
					; 100.00% CPU
					; 167,280 processor cycles
					; 0 bytes consed

;;; Old Recursive version

(defun mult-three-five (n)
    "Finds the sum of all multiples of 3 or 5 under n."
    (cond ((zerop n) 0)
          ((or (equal (mod n 3) 0)
               (equal (mod n 5) 0))
	   (+ n (mult-three-five (- n 1))))
          (t (mult-three-five (- n 1)))))

(defun old-peuler1 ()
  (time (mult-three-five 999)))
