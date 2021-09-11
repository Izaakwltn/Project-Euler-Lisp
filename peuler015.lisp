;;;;-------------------------------------------------------------------------
;;;;Project Euler #15
;;;;-------------------------------------------------------------------------

;;;Starting in the top left corner of a 2×2 grid, 
;;;and only being able to move to the right and down, 
;;;there are exactly 6 routes to the bottom right corner.

;;;How many such routes are there through a 20×20 grid?
;;;;-------------------------------------------------------------------------

(defun fact (n)
        (cond ((zerop n) 1)
              (t (* n (fact (- n 1))))))

(defun combinatoric-route(n)
    (/ (fact (* 2 n))
       (* (fact n) (fact n))))

;;;;-------------------------------------------------------------------------
