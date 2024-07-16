! In number theory, a Wieferich prime is a prime number p such that p²
! evenly divides 2^((p − 1)) − 1.
! 
! It is conjectured that there are infinitely many Wieferich primes, but
! as of March 2021,only two have been identified.
! 
! Task
! 
! -   Write a routine (function procedure, whatever) to find Wieferich
!     primes.
! 
! -   Use that routine to identify and display all of the Wieferich primes
!     less than 5000.
! 
! See also
! 
! * OEIS A001220 - Wieferich primes

USING: io kernel math math.functions math.primes prettyprint
sequences ;

"Wieferich primes less than 5000:" print
5000 primes-upto [ [ 1 - 2^ 1 - ] [ sq divisor? ] bi ] filter .
