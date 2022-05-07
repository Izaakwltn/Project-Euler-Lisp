;;;;-------------------------------------------------------------------------
;;;;Project Euler # 3
;;;;-------------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;The prime factors of 13195 are 5, 7, 13 and 29.

;;What is the largest prime factor of the number 600851475143 ?
;;;;-------------------------------------------------------------------------


(defun prime-factor-search (num)
  (loop :with sqrt-num := (+ 1 (round (sqrt num)))
	
	:for i from sqrt-num :downto 2 by 2
	:if (and (zerop (mod num i))
		   (primep i))
	  :do (return i)))

(defun peuler3 ()
  (time (prime-factor-search 600851475143)))

;Evaluation took:
 ; 0.015 seconds of real time
  ;0.014673 seconds of total run time (0.014666 user, 0.000007 system)
 ; 100.00% CPU
 ; 31,356,894 processor cycles
 ; 0 bytes consed
	
;;;;------------------------------------------------------------------------
;;;old, slow  Dinosaur version

(defvar prime-list '(2 3 5 7))

(defvar largest-prime-factor 0)

(defun prime-sift (n)
    (every #'(lambda (prime)
               (not (equal (mod n prime) 0)))
	   prime-list))

(defun prime-fact-backend (n max)
    (cond ((> n max) largest-prime-factor)
          ((and (prime-sift n) (equal (mod 600851475143 n) 0))
           (setq largest-prime-factor n)
           (setq prime-list (append prime-list (list n)))
           (prime-fact-backend (+ n 2) max))
          ((prime-sift n) (setq prime-list (append prime-list (list n)))
                          (prime-fact-backend (+ n 2) max))
          (t (prime-fact-backend (+ n 2) max))))

(defun prime-fact (max)
    (setq prime-list '(2 3 5 7))
    (prime-fact-backend 3 max))

(defun old-peuler3 ()
    (prime-fact 775147))

;;;;-------------------------------------------------------------------------
