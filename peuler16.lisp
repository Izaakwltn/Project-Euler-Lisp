;;;;------------------------------------------------------------------
;;;;Project Euler # 16
;;;;------------------------------------------------------------------

;;;;2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

;;;;What is the sum of the digits of the number 2^1000?

;;;;------------------------------------------------------------------

(defun power-up (n power)
    (cond ((zerop power) 1)
          (t (* n (power-up n (- power 1))))))

(defun digit-sum (string-num)
    (cond ((zerop (length string-num)) 0)
          (t (+ (parse-integer (subseq string-num 0 1)) 
                (digit-sum (subseq string-num 1))))))

(defun peuler16 ()
    (digit-sum (write-to-string (power-up 2 1000))))
    