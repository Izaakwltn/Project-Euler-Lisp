;;;;------------------------------------------------------------------
;;;;Project Euler # 8
;;;;------------------------------------------------------------------

(in-package :peuler)

;;;;------------------------------------------------------------------------
;;;;The four adjacent digits in the 1000-digit number 
;;;;that have the greatest product are 9 × 9 × 8 × 9 = 5832.

;;;;Find the thirteen adjacent digits in the 1000-digit number 
;;;;that have the greatest product. 

;;;;What is the value of this product?
;;;;-------------------------------------------------------------------------

(defvar bbn
7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)

(defvar big-product 1)

(defun first-str (string)
    (subseq string 0 1))

(defun rest-str (string)
    (subseq string 1))

(defun digit-str (str-num)
    (cond ((equal (length str-num) 1) (list str-num))
          (t (cons (first-str str-num) (digit-str (rest-str str-num))))))

(defun digit-listify (num)
    (mapcar #'parse-integer (digit-str (write-to-string num))))

(defun adj-product (n num-list)
    "products of adjacent n numbers."
    (cond ((zerop n) 1)
          (t (* (first num-list) (adj-product (- n 1) (rest num-list))))))

(defun adj-finder (num-list)
    (cond ((equal (length num-list) 12) big-product)
          ((> (adj-product 13 num-list) big-product) 
           (progn (setq big-product (adj-product 13 num-list))
                  (adj-finder (rest num-list))))
          (t (adj-finder (rest num-list)))))

(defun peuler8 ()
  (time (adj-finder (digit-listify bbn))))

;Evaluation took:
;  0.006 seconds of real time
;  0.005632 seconds of total run time (0.001675 user, 0.003957 system)
;  100.00% CPU
;  11,883,400 processor cycles
;  585,248 bytes consed
;;;;------------------------------------------------------------------------
