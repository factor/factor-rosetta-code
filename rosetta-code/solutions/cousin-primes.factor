! Definitions
! 
! In mathematics, cousin primes are prime numbers that differ by four.
! 
! For the purposes of this task a cousin prime pair is a pair of
! non-negative integers of the form [n, n + 4] whose elements are both
! primes.
! 
! Task
! 
! Write a program to determine (and show here) all cousin prime pairs
! whose elements are both less than 1,000.
! 
! Optionally, show the number of such pairs.
! 
! Also see:
! 
! -   -   the Wikipedia entry: cousin prime.
!     -   the OEIS entry: A094343.
!     -   the MathWorld entry: cousin primes.

USING: kernel lists lists.lazy math math.primes prettyprint
sequences ;

: lcousins ( -- list )
    L{ { 3 7 } } 7 11 [ [ 6 + ] lfrom-by ] bi@ lzip lappend-lazy
    [ [ prime? ] all? ] lfilter ;

lcousins [ last 1000 < ] lwhile [ . ] leach
