;;;;--------------------------------------------------------------------------
;;;;Project Euler #19
;;;;--------------------------------------------------------------------------
(in-package :peuler)
;You are given the following information,
;but you may prefer to do some research for yourself.

    ;1 Jan 1900 was a Monday.
    ;Thirty days has September,
    ;April, June and November.
    ;All the rest have thirty-one,
    ;Saving February alone,
    ;Which has twenty-eight, rain or shine.
    ;And on leap years, twenty-nine.

    ;A leap year occurs on any year evenly divisible by 4,
    ;but not on a century unless it is divisible by 400.

    ;How many Sundays fell on the first of the month during the twentieth century
    ;(1 Jan 1901 to 31 Dec 2000)?


;;;;--------------------------------------------------------------------------

(defvar month-list '(31 28 31 30 31 30 31 31 30 31 30 31))

(defvar leap-list '(31 29 31 30 31 30 31 31 30 31 30 31))

(defvar sunday-count 0)

(defun year (n months)
  (cond ((null months) n)
	((zerop (mod n 7)) (progn (setq sunday-count (+ sunday-count 1))
				  (year (+ n (first months)) (rest months))))
	(t (year (+ n (first months)) (rest months)))))
  
(defun time-cycle (n year)
  (cond ((> year 2000) sunday-count)
	((zerop (mod year 4)) (time-cycle (year n leap-list) (+ year 1)))
	(t (time-cycle (year n month-list) (+ year 1)))))


(defun peuler19 ()
  (time (time-cycle 366 1901)))

;;;;--------------------------------------------------------------------------
