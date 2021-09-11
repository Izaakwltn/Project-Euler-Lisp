;;;;------------------------------------------------------------------
;;;;Project Euler # 10
;;;;------------------------------------------------------------------

;;;;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;;;;Find the sum of all the primes below two million.

;;;;-------------------------------------------------------------------------
;;;;-------------------------------------------------------------------------
(defun numlist (x)
    (loop for i from 2 to x
        collect i))

(defvar sieve-list (numlist 1999999))

(defvar sieve-sum 0)

(defun primep (x)
    (loop for i from 2 to (sqrt x)
          if (equal (mod x i) 0)
             do (return nil)
          finally (return t)))

(defun sieve-it (numlist)
    (loop for j in numlist
        if (primep j)
            do (setq sieve-sum (+ j sieve-sum))
        finally (return sieve-sum)))

(defun peuler10 ()
    (sieve-it sieve-list))

;;;;-------------------------------------------------------------------------
