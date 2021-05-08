;;;;Project Euler # 5

;;;;2520 is the smallest number that can be divided by each of the numbers 

;;;;from 1 to 10 without any remainder.

;;;;What is the smallest positive number that is evenly divisible by 
;;;;all of the numbers from 1 to 20?
(defun peuler5 ()
    (setf fact-list '(1)))

(defun fact-find (n)
    (fact-find-backend n n))

(defun fact-find-backend (n m)
    (cond ((equal m 1) nil)
          ((equal (mod n m) 0) (cons m (fact-find-backend n (- m 1))))
          (t (fact-find-backend n (- m 1)))))

(defun common-fact (n)
    (cond ((equal n 1) fact-list)
          ((equal (length (fact-find n)) 1) 
           (setq fact-list (union fact-list (fact-find n))))
          (t (setq fact-list (union fact-list (rest (fact-find n)))))))


(defun common-fact-rec (n)
    (cond ((equal n 1) nil)
          ((equal (length (fact-find n)) 1)
           (union (fact-find n) (common-fact-rec (- n 1))))
          (t (union (rest (fact-find n)) (common-fact-rec (- n 1))))))




;;;;work up from the bottom
;;;; once a factor is found, run the function with (+ n 1) and 
(defun low-fact (n)
    (low-fact-find n 2))

(defun low-fact-find (n m)
    (cond ((> m n) nil)
          ((equal (mod n m) 0) (cons m (low-fact-find (/ n m) 2)))
          (t (low-fact-find n (+ m 1)))))

(defun low-common-fact (n)
    (cond ((equal n 1) nil)
          (t (union (low-fact n) (low-common-fact (- n 1))))))  

(defun peuler5 ()
    (reduce #'* (low-common-fact 20)))

(defun my-union (x y)
    (cond ((null ))))


(defun low-common-fact (n)
    (cond ((equal n 1) nil)
          (t (nunion (low-fact n) (low-common-fact (- n 1))))))  


;;;Less eloquent, brute-force approach

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