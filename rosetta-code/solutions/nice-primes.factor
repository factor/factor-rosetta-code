! Task:
! 
! ::# Take an positive integer n
! 
! ::# sumn is the sum of the decimal digits of n
! 
! ::# If sumn's length is greater than 1 (unity), repeat step 2 for n =
! sumn
! 
! ::# Stop when sumn's length is equal to 1 (unity)
! 
! If n and sumn are prime, then n is a Nice prime
! 
! Let 500 < n < 1000
! 
! Example:
! 
!            853 (prime)
!            8 + 5 + 3 = 16
!            1 + 6 = 7 (prime)
! 
! Also see:
! 
! -   -   The OEIS article: A78403 Primes such that digital root is prime.

USING: math math.primes prettyprint sequences ;

: digital-root ( m -- n ) 1 - 9 mod 1 + ;

500 1000 primes-between [ digital-root prime? ] filter .
