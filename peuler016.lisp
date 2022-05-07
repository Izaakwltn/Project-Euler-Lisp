;;;;------------------------------------------------------------------
;;;;Project Euler # 16
;;;;------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;;;2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

;;;;What is the sum of the digits of the number 2^1000?

;;;;------------------------------------------------------------------

(defun digit-sum (string-num)
    (cond ((zerop (length string-num)) 0)
          (t (+ (parse-integer (subseq string-num 0 1)) 
                (digit-sum (subseq string-num 1))))))

(defun peuler16 ()
    (time (digit-sum (write-to-string (expt 2 1000)))))

;Evaluation took:
;  0.000 seconds of real time
;  0.000324 seconds of total run time (0.000319 user, 0.000005 system)
;  100.00% CPU
;  678,632 processor cycles
;  85,312 bytes consed
;;;;------------------------------------------------------------------------
