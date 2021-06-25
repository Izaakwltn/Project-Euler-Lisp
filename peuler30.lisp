;;;;-------------------------------------------------------------------------
;;;;Peuler30
;;;;-------------------------------------------------------------------------

;;;;Surprisingly there are only three numbers 
;;;;that can be written as the sum of fourth powers of their digits:

;;;;1634 = 14 + 64 + 34 + 44
;;;;8208 = 84 + 24 + 04 + 84
;;;;9474 = 94 + 44 + 74 + 44
;;;;As 1 = 14 is not a sum it is not included.

;;;;The sum of these numbers is 1634 + 8208 + 9474 = 19316.

;;;;Find the sum of all the numbers that can be written 
;;;;as the sum of fifth powers of their digits.
;;;;Is there no limit?
;;;;-------------------------------------------------------------------------
(defun power (n exp)
    (cond ((zerop exp) 1)
          (t (* n (power n (- exp 1))))))

(defun digits-to-the-fifth (stringnum)
    (cond ((zerop (length stringnum)) 0)
          (t (+ (power (parse-integer (subseq stringnum 0 1)) 5) 
                (digits-to-the-fifth (subseq stringnum 1))))))

(defun power-number-finder (n)
    (cond ((> n 355000) 0)
          ((equal n (digits-to-the-fifth (write-to-string n))) 
           (+ n (power-number-finder (+ n 1))))
          (t (power-number-finder (+ n 1)))))

(defun peuler30 ()
    (power-number-finder 2))
;;;;-------------------------------------------------------------------------