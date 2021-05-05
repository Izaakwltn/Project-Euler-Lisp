;;;;PEuler1

;;;If we list all the natural numbers below 10 that are multiples of 3 or 5, 
;;;we get 3, 5, 6 and 9. The sum of these multiples is 23.

;;;Find the sum of all the multiples of 3 or 5 below 1000.

(defun peuler1 ()
    (mult-three-five 999))

(defun mult-three-five (n)
    "Finds the sum of all multiples of 3 or 5 under n."
    (cond ((zerop n) 0)
          ((or (equal (mod n 3) 0)
               (equal (mod n 5) 0)) (+ n (mult-three-five (- n 1))))
          (t (mult-three-five (- n 1)))))
