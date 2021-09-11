;;;;-------------------------------------------------------------------------
;;;;Project Euler # 6
;;;;-------------------------------------------------------------------------

;;;;The sum of the squares of the first ten natural numbers is,
;;;;1^2 + 2^2 + ... + 10^2 = 385

;;;;The square of the sum of the first ten natural numbers is,
;;;;(1 + 2 + ... + 10)^2 = 2035

;;;;Hence the difference between the sum of the squares 
;;of the first ten natural numbers and the square of the sum is
;;;;3025 - 385 = 2640

;;;;Find the difference between the sum of the squares of the 
;;;;first one hundred natural numbers and the square of the sum.
;;;;-------------------------------------------------------------------------

(defun sum-square (n)
    (cond ((zerop n) 0)
          (t (+ (* n n) (sum-square (- n 1))))))

(defun summed (n)
    (cond ((zerop n) 0)
          (t (+ n (summed (- n 1))))))

(defun square-sum (n)
    (* (summed n) (summed n)))

(defun peuler6 ()
    (- (square-sum 100) (sum-square 100)))
