;;;;--------------------------------------------------------------------------
;;;;Project Euler #25
;;;;--------------------------------------------------------------------------
(in-package :peuler)
;The Fibonacci sequence is defined by the recurrence relation:

;    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

;Hence the first 12 terms will be:

 ;   F1 = 1
  ;  F2 = 1
   ; F3 = 2
    ;F4 = 3
   ; F5 = 5
   ; F6 = 8
  ;  F7 = 13
  ;  F8 = 21
 ;   F9 = 34
  ;  F10 = 55
   ; F11 = 89
  ;  F12 = 144

;The 12th term, F12, is the first term to contain three digits.

;What is the index of the first term in the Fibonacci
;sequence to contain 1000 digits?
;;;;--------------------------------------------------------------------------

(defvar oldfib1 1) ; 2 3 

(defvar oldfib2 1) ; 1 2 3 

(defun fib-climb (fib counter max-digits ) ;(2 3 1000)
  (cond ((equal (length (write-to-string fib)) max-digits) counter)
	(t (progn (setq oldfib2 oldfib1)
		  (setq oldfib1 fib)
		  (fib-climb (+ oldfib2 fib) (+ counter 1) max-digits)))))

(defun peuler25 ()
  (time (fib-climb 2 3 1000)))

;;;;--------------------------------------------------------------------------
