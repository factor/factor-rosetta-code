! Task:
! 
! Create code that will list (preferably calculate) all of the Mersenne
! primes until some limitation is reached.
! 
! The number of known Mersenne primes is 51 (as of June, 2020), and the
! largest known Mersenne prime contains contains 24,862,048 decimal
! digits.
! 
! Also see:
! 
! -   the Wikipedia entry: Mersenne prime.
! -   the MathWorld entry; Mersenne prime.
! -   For a list of all the know Mersenne primes:
!     [https://primes.utm.edu/mersenne/index.html#known list of Mersenne
! -   For a general website about primes: prime pages.
! -   the OEIS entry: Mersenne primes.
! -   the OEIS entry: A000043 Mersenne exponents: primes p such that 2^p -
!     1 is prime. Then 2^p - 1 is called a Mersenne prime.

USING: formatting math.primes.lucas-lehmer math.ranges sequences ;

: mersennes-upto ( n -- seq ) [1,b] [ lucas-lehmer ] filter ;

3500 mersennes-upto [ "2 ^ %d - 1\n" printf ] each
