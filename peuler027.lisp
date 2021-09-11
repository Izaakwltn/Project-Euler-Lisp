;;;;-------------------------------------------------------------------------
;;;;Project Euler #27- Quadratic Primes
;;;;-------------------------------------------------------------------------

;;;;Euler discovered the remarkable quadratic formula:

;It turns out that the formula n^2 + n + 41 will produce 40 primes 

;for the consecutive integer values 0 <= n <= 39. 

;However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, 

;and certainly when n = 41, 41^2 + 41 + 41  is clearly divisible by 41.

;The incredible formula n^2 - 79 + 1601
;was discovered, which produces 80 primes for the consecutive values
;0 <= n <= 79.
;The product of the coefficients, −79 and 1601, is −126479.

;Considering quadratics of the form:
    ;n^2 + an + b, where abs(a) < 1000 and abs(b) <= 1000
    ;where abs(n) is the modulus/absolute value of n

;Find the product of the coefficients, a and b, 
;for the quadratic expression that produces the 
;maximum number of primes for consecutive values of n, starting with n = 0.
;;;;-------------------------------------------------------------------------