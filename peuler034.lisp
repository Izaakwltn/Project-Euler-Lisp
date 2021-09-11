;;;;-------------------------------------------------------------------------
;;;;Project Euler #34
;;;;-------------------------------------------------------------------------

;145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

;Find the sum of all numbers which are equal to the sum of the 
;factorial of their digits.

;Note: As 1! = 1 and 2! = 2 are not sums they are not included.
;;;;-------------------------------------------------------------------------

(defun factorial (n)
    (cond ((zerop n) 1)
          (t (* n (factorial (- n 1))))))

 ;take a number n, convert to a string
					;
(defun fact-adder (string-num)
  (cond ((zerop (length string-num)) 0)
	(t (+ (factorial (parse-integer (subseq string-num 0 1)))
	      (fact-adder (subseq string-num 1))))))

(defun fact-finder (n)
  (cond ((> n  2540160) 0)
	((equal n (fact-adder (write-to-string n))) (+ n (fact-finder (+ n 1))))
	(t (fact-finder (+ n 1)))))

(defun peuler34()
  (fact-finder 10)
  
(peuler34)
  
;;;;--------------------------------------------------------------------------
