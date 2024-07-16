! The name cuban has nothing to do with Cuba  (the country), but has to do
! with the fact that cubes (3^(rd) powers) play a role in its definition.
! 
! Some definitions of cuban primes:
! 
! -   -   primes which are the difference of two consecutive cubes.
!     -   primes of the form: (n+1)³ - n³.
!     -   primes of the form: n³ - (n-1)³.
!     -   primes p such that n²(p+n) is a cube for some n>0.
!     -   primes p such that 4p = 1 + 3n².
! 
! Cuban primes were named in 1923 by Allan Joseph Champneys Cunningham.
! 
! Task requirements:
! 
! -   -   show the first 200 cuban primes (in a multi─line horizontal
!         format).
!     -   show the 100,000^(th) cuban prime.
!     -   show all cuban primes with commas (if appropriate).
!     -   show all output here.
! 
! Note that cuban prime isn't capitalized (as it doesn't refer to the
! nation of Cuba).
! 
! Also see:
! 
! -   -   Wikipedia entry: cuban prime.
!     -   MathWorld entry: cuban prime.
!     -   The OEIS entry: A002407. The 100,000^(th) cuban prime can be
!         verified in the 2^(nd) example on this OEIS web page.

USING: formatting grouping io kernel lists lists.lazy math
math.primes sequences tools.memory.private ;
IN: rosetta-code.cuban-primes

: cuban-primes ( n -- seq )
    1 lfrom [ [ 3 * ] [ 1 + * ] bi 1 + ] <lazy-map>
    [ prime? ] <lazy-filter> ltake list>array ;

200 cuban-primes 10 <groups>
[ [ commas ] map [ "%10s" printf ] each nl ] each nl

1e5 cuban-primes last commas "100,000th cuban prime is: %s\n"
printf
