! The prime decomposition of a number is defined as a list of prime
! numbers which when all multiplied together, are equal to that number.
! 
! Example:
! 
!  12 = 2 × 2 × 3,  so its prime decomposition is  {2, 2, 3}
! 
! Task:
! 
! Write a function which returns an array or collection which contains the
! prime decomposition of a given number n greater than 1.
! 
! If your language does not have an isPrime-like function available, you
! may assume that you have a function which determines whether a number is
! prime (note its name before your code).
! 
! If you would like to test code from this task, you may use code from
! trial division or the Sieve of Eratosthenes.
! 
! Note: The program must not be limited by the word size of your computer
! or some other artificial limit; it should work for any number regardless
! of size (ignoring the physical limits of RAM etc).
! 
! Related tasks:
! 
! -   count in factors
! -   factors of an integer
! -   Sieve of Eratosthenes
! -   primality by trial division
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes
! -   sequence of primes by Trial Division
! 
! Category:Arbitrary precision

USING: io kernel math math.parser math.primes.factors sequences ;

27720 factors 
[ number>string ] map
" " join print ;
