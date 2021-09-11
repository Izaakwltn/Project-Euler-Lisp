;;;;--------------------------------------------------------------------------
;;;;Project Euler #48
;;;;--------------------------------------------------------------------------
;;;;
;

;The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
;Find the last ten digits of the series,11 + 22 + 33 + ... + 10001000.
;;;;--------------------------------------------------------------------------


(defun power (n power)
  (cond ((zerop power) 1)
	(t (* n (power n (- power 1))))))

(defun power-play (max)
  (loop for i from 1 to max
        sum (power i i) into power-sum
        finally (return power-sum)))

(defun peuler48 ()
 (reverse (subseq (reverse (write-to-string (power-play 1000))) 0 10)))


