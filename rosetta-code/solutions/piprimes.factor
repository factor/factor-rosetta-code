! Task:
! 
! pi(n), the number of primes <= n, where pi(n) < 22
! 
! Also see:
! 
! -   -   Prime-counting_function.
!     -   Tables and hints by Tomás Oliveira e Silva.
!     -   the OEIS entry: A0000720 pi(n), the number of primes <= n.
!         Sometimes called PrimePi(n)....
! 
! Category:Prime Numbers

USING: formatting grouping io lists math.primes
math.primes.lists math.ranges math.statistics sequences ;

21 lprimes lnth [1,b) [ prime? ] cum-count
10 group [ [ "%2d " printf ] each nl ] each
