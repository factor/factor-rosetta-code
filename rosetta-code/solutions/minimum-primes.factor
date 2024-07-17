! Task:
! 
! Given three lists:
! 
! -   Numbers1 = [5,45,23,21,67]
! -   Numbers2 = [43,22,78,46,38]
! -   Numbers3 = [9,98,12,54,53]
! 
! then:
! 
! 1.  Select the maximum (max) of Numbers[n], Numbers2[n] and Numbers3[n],
!     where n <= 5 (one based).
! 2.  For each value of max, find the least prime, minPrime, such that
!     minPrime >= max
! 3.  Add minPrime to a new list (Primes)
! 4.  Show Primes on this page.

USING: math math.order math.primes prettyprint sequences ;

{ 5 45 23 21 67 } { 43 22 78 46 38 } { 9 98 12 54 53 }
[ max max 1 - next-prime ] 3map .
