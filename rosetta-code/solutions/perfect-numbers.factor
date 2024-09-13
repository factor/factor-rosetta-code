! category:Discrete math
! 
! Write a function which says whether a number is perfect.
! 
! A perfect number is a positive integer that is the sum of its proper
! positive divisors excluding the number itself.
! 
! Equivalently, a perfect number is a number that is half the sum of all
! of its positive divisors (including itself).
! 
! Note: The faster Lucas-Lehmer test is used to find primes of the form
! 2^(n)-1, all known perfect numbers can be derived from these primes
! using the formula (2^(n) - 1) × 2^(n - 1).
! 
! It is not known if there are any odd perfect numbers (any that exist are
! larger than 10²⁰⁰⁰).
! 
! The number of known perfect numbers is 51 (as of December, 2018), and
! the largest known perfect number contains 49,724,095 decimal digits.
! 
! See also:
! 
! -   -   Rational Arithmetic
!     -   Perfect numbers on OEIS
!     -   Odd Perfect showing the current status of bounds on odd perfect
!         numbers.

USING: kernel math math.primes.factors sequences ;
IN: rosettacode.perfect-numbers

: perfect? ( n -- ? )  [ divisors sum ] [ 2 * ] bi = ;
