;;;;--------------------------------------------------------------------------
;;;;Project Euler #50
;;;;--------------------------------------------------------------------------
(in-package :peuler)
;The prime 41, can be written as the sum of six consecutive primes:
;41 = 2 + 3 + 5 + 7 + 11 + 13

;This is the longest sum of consecutive primes
;that adds to a prime below one-hundred.

;The longest sum of consecutive primes below one-thousand that adds to a prime,
;contains 21 terms, and is equal to 953.

;Which prime, below one-million, can be written as the sum of the most consecutive primes?
;;;;--------------------------------------------------------------------------
(defun primep (n)
  (loop for i from 2 to (sqrt n)
	if (zerop (mod n i))
	  do (return nil)
	finally (return t)))

(defun prime-list (max)
  (loop for i from 2 to max
	if (primep i)
	  collect i into primes
	finally (return primes)))

(defvar big-prime-prime '(0 0)) ;sum counter

(defun prime-adder (primelist counter sum)
  (cond ((or (> sum 1000000) (null primelist)) 0)
	((and (> counter (second big-prime-prime))
	      (primep sum))
	 (progn (setq big-prime-prime (list sum counter))
		(prime-adder (rest primelist) (+ counter 1)
			     (+ sum (first primelist)))))
	(t (prime-adder (rest primelist) (+ counter 1)
			(+ sum (first primelist))))))
	 
(defun prime-prime-finder (primelist)
  (cond ((null primelist) (first big-prime-prime))
	(t (progn (prime-adder primelist 0 0)
	          (prime-prime-finder (rest primelist))))))

(defun peuler50 ()
  (time (prime-prime-finder (prime-list 1000000))))

;;;;--------------------------------------------------------------------------

