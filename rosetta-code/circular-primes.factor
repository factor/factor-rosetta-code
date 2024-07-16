! Definitions
! 
! A circular prime is a prime number with the property that the number
! generated at each intermediate step when cyclically permuting its (base
! 10) digits will also be prime.
! 
! For example: 1193 is a circular prime, since 1931, 9311 and 3119 are all
! also prime.
! 
! Note that a number which is a cyclic permutation of a smaller circular
! prime is not considered to be itself a circular prime. So 13 is a
! circular prime, but 31 is not.
! 
! A repunit (denoted by R) is a number whose base 10 representation
! contains only the digit 1.
! 
! For example: R(2) = 11 and R(5) = 11111 are repunits.
! 
! Task
! 
! -   Find the first 19 circular primes.
! 
! -   If your language has access to arbitrary precision integer
!     arithmetic, given that they are all repunits, find the next 4
!     circular primes.
! 
! -   (Stretch) Determine which of the following repunits are probably
!     circular primes: R(5003), R(9887), R(15073), R(25031), R(35317) and
!     R(49081). The larger ones may take a long time to process so just do
!     as many as you reasonably can.
! 
! See also
! 
! -   Wikipedia article - Circular primes.
! -   Wikipedia article - Repunit.
! -   OEIS sequence A016114 - Circular primes.

USING: combinators.short-circuit formatting io kernel lists
lists.lazy math math.combinatorics math.functions math.parser
math.primes sequences sequences.extras ;

! Create an ordered infinite lazy list of circular prime
! "candidates" -- the numbers 2, 3, 5 followed by numbers
! composed of only the digits 1, 3, 7, and 9.

: candidates ( -- list )
    L{ "2" "3" "5" "7" } 2 lfrom
    [ "1379" swap selections >list ] lmap-lazy lconcat lappend ;

: circular-prime? ( str -- ? )
    all-rotations {
        [ [ infimum ] [ first = ] bi ]
        [ [ string>number prime? ] all? ]
    } 1&& ;

: circular-primes ( -- list )
    candidates [ circular-prime? ] lfilter ;

: prime-repunits ( -- list )
    7 lfrom [ 10^ 1 - 9 / prime? ] lfilter ;

"The first 19 circular primes are:" print
19 circular-primes ltake [ write bl ] leach nl nl

"The next 4 circular primes, in repunit format, are:" print
4 prime-repunits ltake [ "R(%d) " printf ] leach nl
