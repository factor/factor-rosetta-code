! Definitions
! 
! In mathematics, additive primes are prime numbers for which the sum of
! their decimal digits are also primes.
! 
! Task
! 
! Write a program to determine (and show here) all additive primes less
! than 500.
! 
! Optionally, show the number of additive primes.
! 
! Also see:
! 
! -   -   the OEIS entry: A046704 additive primes.
!     -   the prime-numbers entry: additive primes.
!     -   the geeks for geeks entry: additive prime number.
!     -   the prime-numbers fandom: additive primes.

USING: formatting grouping io kernel math math.primes
prettyprint sequences ;

: sum-digits ( n -- sum )
    0 swap [ 10 /mod rot + swap ] until-zero ;

499 primes-upto [ sum-digits prime? ] filter
[ 9 group simple-table. nl ]
[ length "Found  %d  additive primes  <  500.\n" printf ] bi
