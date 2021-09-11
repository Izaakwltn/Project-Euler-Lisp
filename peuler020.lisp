;;;;-------------------------------------------------------------------------
;;;;Project Euler #20
;;;;-------------------------------------------------------------------------

;;;;n! means n × (n − 1) × ... × 3 × 2 × 1

;;;;For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;;;;and the sum of the digits in the number 10! is 
;;;;3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

;;;;Find the sum of the digits in the number 100!

;;;;-------------------------------------------------------------------------

(defun fact (n)
    (cond ((zerop n) 1)
    (t (* n (fact (- n 1))))))



(defun digit-sum (string-num)
    (cond ((zerop (length string-num)) 0)
          (t (+ (parse-integer (subseq string-num 0 1)) 
                (digit-sum (subseq string-num 1))))))

(defun peuler20 ()
(digit-sum (write-to-string (fact 100))))

;;;;-------------------------------------------------------------------------
