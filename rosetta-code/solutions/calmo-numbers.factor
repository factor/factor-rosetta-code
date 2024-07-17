! Definition
! 
! Let n be a positive integer having k divisors (other than 1 and n
! itself) where k is exactly divisible by 3.
! 
! Add the first three eligible divisors, then the next three, and so on
! until the eligible divisors are exhausted. If the resulting partial sums
! are prime numbers, then n is called a Calmo number.
! 
! Example
! 
! Consider n = 165.
! 
! It has 6 eligible divisors, namely [3 5 11 15 33 55].
! 
! The sum of the first three is: 3 + 5 + 11 = 19 which is a prime number.
! 
! The sum of the next three is: 15 + 33 + 55 = 103 which is also a prime
! number.
! 
! Hence n is a Calmo number.
! 
! Task
! 
! Find and show here all Calmo numbers under 1000.

USING: combinators.short-circuit grouping.extras kernel math
math.functions math.primes math.primes.factors math.vectors
prettyprint ranges sequences sequences.extras ;
IN: calmo

: calmo? ( n -- ? )
    divisors 1 -1 rot subseq* {
        [ empty? not ]
        [ length 3 divisor? ]
        [ [ + + prime? ] 3 group-map vall? ]
    } 1&& ;

MAIN: [ 2 1000 [a..b) [ calmo? ] filter . ]
