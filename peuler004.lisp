;;;;-------------------------------------------------------------------------
;;;;Project Euler # 4
;;;;-------------------------------------------------------------------------

;;;A palindromic number reads the same both ways. 
;;;The largest palindrome made from 
;;;the product of two 2-digit numbers is 9009 = 91 × 99.

;;;Find the largest palindrome made from the product of two 3-digit numbers.

;;;;-------------------------------------------------------------------------


(defun palindromep (n)
    (equal (write-to-string n) (reverse (write-to-string n))))

(defun three-digit-multiplier (n)
       (cond ((equal n 100) (format t "Palindrome Number: ~S" big-palindrome))
             (t (three-digit-internal n 999))))

    (defun three-digit-internal (n m)
       (cond ((equal m 100) (three-digit-multiplier (- n 1)))
             ((and (palindromep (* n m))
                   (> (* n m) big-palindrome)) (progn (setq big-palindrome (* n m))) 
                                               (three-digit-internal n (- m 1)))
             (t (three-digit-internal n (- m 1)))))

(defun peuler4 ()
    (setq big-palindrome 10201)
    (three-digit-multiplier 999))

;;;;-------------------------------------------------------------------------