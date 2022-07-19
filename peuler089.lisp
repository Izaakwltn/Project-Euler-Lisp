;;;; Project euler #89
;;;; peuler089.lisp
;;;;
;;;; Izaak Walton

(in-package :peuler)

;;; For a number written in Roman numerals to be considered valid
;;; there are basic rules which must be followed. Even though the rules allow
;;; some numbers to be expressed in more than one way
;;; there is always a "best" way of writing a particular number.

;;; For example, it would appear that there are at least six ways of writing the number sixteen:

;;; IIIIIIIIIIIIIIII
;;; VIIIIIIIIIII
;;; VVIIIIII
;;; XIIIIII
;;; VVVI
;;; XVI

;;; However, according to the rules only XIIIIII and XVI are valid,
;;; and the last example is considered to be the most efficient,
;;; as it uses the least number of numerals.

;;; The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
;;; contains one thousand numbers written in valid, but not necessarily minimal,
;;; Roman numerals; see About... Roman Numerals for the definitive rules for this problem.

;;; Find the number of characters saved by writing each of these in their minimal form.

;;;Note: You can assume that all the Roman numerals in the file contain
;;; no more than four consecutive identical units.

(defun parse-numerals ()
  (uiop:read-file-lines
   (asdf:system-relative-pathname "peuler" "p089_roman.txt")))

(defvar roman-values '((1    "I")
                       (4    "IV")
                       (5    "V")
                       (9    "IX")
                       (10   "X")
                       (40   "XL")
                       (50   "L")
                       (90   "XC")
                       (100  "C")
                       (400  "CD")
                       (500  "D")
                       (900  "CM")
                       (1000 "M")))

(defun decimal-value (roman)
  (first (find-if #'(lambda (pair)
                       (string-equal (second pair) roman))
                   roman-values)))

(defun roman-value (n)
  (second (assoc n roman-values)))

(defun roman-decimal (romanstring)
  (cond ((string-equal romanstring "") 0)
        ((and (> (length romanstring) 1)
              (find-if #'(lambda (n)
                           (string-equal n (subseq romanstring 0 2)))
                 '("IV" "IX" "XL" "XC" "CD" "CM")))
         (+ (decimal-value (subseq romanstring 0 2))
            (roman-decimal (subseq romanstring 2))))
        (t (+ (decimal-value (subseq romanstring 0 1))
              (roman-decimal (subseq romanstring 1))))))

(defun biggest-subtractable (n)
  (loop :for i :in '(1000 900 500 400 100 90 50 40 10 9 5 4 1)
        :if (>= (- n i) 0)
          :do (return i)))

(defun decimal-roman (n)
  (cond ((zerop n) "")
        (t (let ((bs (biggest-subtractable n)))
             (concatenate 'string (second (assoc bs compact-roman-values))
                          (decimal-roman (- n bs)))))))

(defun saved-characters ()
  (reduce #'+ (mapcar #'(lambda (r)
                          (- (length r) (length (decimal-roman (roman-decimal r)))))
                      (parse-numerals))))

(defun peuler89 ()
  (saved-characters))
