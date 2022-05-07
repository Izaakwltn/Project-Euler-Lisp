;;;;-------------------------------------------------------------------------
;;;;Project Euler #2 - Amicable numbers
;;;;-------------------------------------------------------------------------
(in-package :peuler)
;;;;Let d(n) be defined as the sum of proper divisors of n 
;;;;(numbers less than n which divide evenly into n).
;;;;If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair 
;;;;and each of a and b are called amicable numbers.

;;;;For example, the proper divisors of 220 are 
;;;;1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
;;;;therefore d(220) = 284. 
;;;;The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

;;;;Evaluate the sum of all the amicable numbers under 10000.
;;;;-------------------------------------------------------------------------

(defun d (n)
    (loop for i from 1 to (/ n 2)
          if (zerop (mod n i))
             sum i into divsum
             
          finally (return divsum)))

(defun amicable-numbers (max)
    (loop for i from 220 to max
            if (and (equal i (d (d i)))
                    (not (equal i (d i))))
                sum i into amicable-sum
            finally (return amicable-sum)))

(defun peuler21 ()
    (time (amicable-numbers 9999)))
;;;;-------------------------------------------------------------------------
