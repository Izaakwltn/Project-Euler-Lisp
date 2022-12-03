;;;;Project Euler # 14
;;;; peuler014
;;;; 
;;;; Izaak Walton


(in-package :peuler)

;;; The following iterative sequence is defined for the set of positive integers:

;;; n → n/2 (n is even)
;;; n → 3n + 1 (n is odd)

;;; Using the rule above and starting with 13, we generate the following sequence:
;;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

;;; It can be seen that this sequence (starting at 13 and finishing at 1) 
;;; contains 10 terms. Although it has not been proved yet (Collatz Problem), 
;;; it is thought that all starting numbers finish at 1.

;;; Which starting number, under one million, produces the longest chain?

;;;NOTE: Once the chain starts the terms are allowed to go above one million.

(defun collatz (n)
    (cond ((equal n 1) nil)
          ((evenp n) (cons n (collatz (/ n 2))))
          (t (cons n (collatz (+ 1 (* 3 n)))))))

(defvar big-collatz '(1 1))

(defun big-collatz-search (n)
    (loop for i from 1 to n
              if (> (length (collatz i)) (second big-collatz))
                 do (setq big-collatz (list i (length (collatz i))))
              finally (return big-collatz)))

(defun peuler14 ()
  (setq big-collatz '(1 1))
  (time (first (big-collatz-search 1000000))))

;Evaluation took:
;  3.572 seconds of real time
;  3.588940 seconds of total run time (3.556570 user, 0.032370 system)
;  [ Run times consist of 0.163 seconds GC time, and 3.426 seconds non-GC time. ]
;  100.48% CPU
;  7,544,448,272 processor cycles
;  2,103,108,672 bytes consed
