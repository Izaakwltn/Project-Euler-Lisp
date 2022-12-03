;;;; Project Euler #8
;;;; peuler008.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; A Pythagorean triplet is a set of three natural numbers, 
;;; a < b < c, for which,
;;; a2 + b2 = c2

;;; For example, 32 + 42 = 9 + 16 = 25 = 52.

;;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;;; Find the product abc.

;;;Using the Dickson Method!

(defun first-nth (n list)
    (cond ((zerop n) nil)
          (t (cons (first list) (first-nth (- n 1) (rest list))))))

(defun first-half (list)
    (first-nth (/ (length list) 2) list))

(defun find-fact-backend (n m)
    (cond ((zerop m) nil)
          ((equal (mod n m) 0) (cons m (find-fact-backend n (- m 1))))
          (t (find-fact-backend n (- m 1)))))

(defun find-fact (n)
    (find-fact-backend n n))

(defun make-triples (r factor-list)
    (cond ((null factor-list) nil)
          (t (cons (list r (/ (/ (* r r) 2) (first factor-list)) (first factor-list))
                   (make-triples r (rest factor-list))))))

(defun fact-triples (r)
    (make-triples r (first-half (find-fact (/ (* r r) 2)))))

;;; X^2 + y^2 = Z^2
;;; x = r + s, y = r + t, z = r + s + t
;;; x = r + (first )

(defun xyz-convert (triples-list)
    (cond ((null triples-list) nil)
          (t (cons (list (+ (first (first triples-list))
                            (second (first triples-list)))
                         (+ (first (first triples-list))
                            (third (first triples-list)))
                         (+ (first (first triples-list))
                            (second (first triples-list))
                            (third (first triples-list)))) 
                   (xyz-convert (rest triples-list))))))

(defun pythag-triples (r)
    (xyz-convert (fact-triples r)))

(defun kilo-eval (xyz-list)
    (cond ((null xyz-list) nil)
          ((equal (+ (first (first xyz-list)) 
                     (second (first xyz-list))
                     (third (first xyz-list)))
		  1000)
	   (first xyz-list))
          (t (kilo-eval (rest xyz-list)))))

(defun dickson-eval (r)
    (cond ((kilo-eval (pythag-triples r)) (kilo-eval (pythag-triples r)))
          (t (dickson-eval (+ r 2)))))

(defun peuler9 ()
  (time (reduce #'* (dickson-eval 2))))

;Evaluation took:
;  0.015 seconds of real time
;  0.014711 seconds of total run time (0.014648 user, 0.000063 system)
;  100.00% CPU
;  31,224,166 processor cycles
;  98,304 bytes consed
