;;;;-------------------------------------------------------------------------
;;;;Project Euler # 7
;;;;-------------------------------------------------------------------------

;;;;By listing the first six prime numbers: 
;;;;2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

;;;;What is the 10,001st prime number?

;;;;-------------------------------------------------------------------------

(defun primep (n)
    (every #'(lambda (prime)
                  (not (equal (mod n prime) 0))) prime-list))

(defun prime-finder (n)
    (cond ((equal (length prime-list) 10001) (first prime-list))
          ((primep n) (progn (setq prime-list (cons n prime-list))
                             (prime-finder (+ n 2))))
          (t (prime-finder(+ n 2)))))

(defun peuler7 ()
    (setq prime-list '(2 3 5 7))
    (prime-finder 11))

;;;;-------------------------------------------------------------------------