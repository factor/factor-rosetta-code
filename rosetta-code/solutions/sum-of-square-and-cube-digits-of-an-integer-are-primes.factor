! Task:
! 
! Find and show here all positive integers n less than 100 where:
! 
! -   the sum of the digits of the square of n is prime; and
! -   the sum of the digits of the cube of n is also prime.
! 
! Example:
! 
! 16 satisfies the task descrption because 16 x 16 = 256 has a digit sum
! of 13 which is prime and 16 x 16 x 16 = 4096 has a digit sum of 19 which
! is also prime.

USING: kernel math math.functions math.primes math.text.utils prettyprint sequences ;

100 <iota> [ [ sq ] [ 3 ^ ] bi [ 1 digit-groups sum prime? ] both? ] filter .
