;A permutation is an ordered arrangement of objects. F
;or example, 3124 is one possible permutation of the 
;digits 1, 2, 3 and 4. If all of the permutations are listed 
;numerically or alphabetically, we call it lexicographic order. 
;The lexicographic permutations of 0, 1 and 2 are:

;012   021   102   120   201   210

;What is the millionth lexicographic permutation of the digits 
;0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

;;;;-------------------------------------------------------------------------

;you start with 123456789
;last number is 987654321

;from 123456789 -> 123456798 -> 123456879 -> 123456897
;123456978 -> 123456987 -> 123457689
;start from last digit, if the last digit can be 
;increased by switching it with the adjacent, switch them
;if not, replace the next digit with the last digit, arrange in ascending order

(defun permutate (counter digit-list))
;counter to check number of permutations

;;;;;maybe don't even deal with a full number, use a list of digits!
;Maybe backwards in reverse with first and rests
digit list (1 2 3 4)n

(1 2 3 4) -> (2 3 4 1)
(append (rest digit-list) (list (first digit-list)))

(1 2 3 4) (1 2 4 3) (1 3 2 4) (1 3 4 2) (1 4 2 3) (1 4 3 2) 

;if last is greater than second to last, swap it
;if last is less than the second to last, swap last with third to last

;maybe think of it as n, n-1, n-2, n-3

;function digit swap, takes two place values as input, returns reconfigured list
(defun digitswap)