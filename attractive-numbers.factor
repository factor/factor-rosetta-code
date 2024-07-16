! A number is an attractive number if the number of its prime factors
! (whether distinct or not) is also prime.
! 
! Example:
! 
! The number 20, whose prime decomposition is 2 × 2 × 5, is an attractive
! number because the number of its prime factors (3) is also prime.
! 
! Task:
! 
! Show sequence items up to 120.
! 
! Reference:
! 
! -   -   The OEIS entry: A063989: Numbers with a prime number of prime
!         divisors.

USING: formatting grouping io math.primes math.primes.factors
math.ranges sequences ;

"The attractive numbers up to and including 120 are:" print
120 [1,b] [ factors length prime? ] filter 20 <groups>
[ [ "%4d" printf ] each nl ] each
