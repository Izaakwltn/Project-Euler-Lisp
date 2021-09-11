;;;;Project Euler # 5

;;;;2520 is the smallest number that can be divided by each of the numbers 

;;;;from 1 to 10 without any remainder.

;;;;What is the smallest positive number that is evenly divisible by 
;;;;all of the numbers from 1 to 20?

(defun divisiblep (n cap)
    (cond ((equal cap 1) t)
          ((not (equal (mod n cap) 0)) nil)
          (t (divisiblep n (- cap 1)))))

(defun div-check (n cap)
    "Finds the smallest number that is divisible by all numbers under cap."
    (cond ((divisiblep n cap) n)
          (t (div-check (+ n 1) cap))))

(defun peuler5 ()
    (div-check 1 20))
