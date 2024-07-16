! The sequence of primorial primes is given as the increasing values of n
! where primorial(n) ± 1 is prime.
! 
! Noting that the n'th primorial is defined as the multiplication of the
! smallest n primes, the sequence is of the number of primes, in order
! that when multiplied together is one-off being a prime number itself.
! 
! Task:
! 
! Generate and show here the first ten values of the sequence.
! 
! Optional extended task:
! 
! Show the first twenty members of the series.
! 
! Notes:
! 
! -   This task asks for the primorial indices that create the final
!     primorial prime numbers, so there should be no ten-or-more digit
!     numbers in the program output (although extended precision integers
!     will be needed for intermediate results).
! -   There is some confusion in the references, but for the purposes of
!     this task the sequence begins with n = 1.
! -   Probabilistic primality tests are allowed, as long as they are good
!     enough such that the output shown is correct.
! 
! Related tasks:
! 
! -   Primorial numbers
! -   Factorial
! 
! See also:
! 
! -   Primorial prime Wikipedia.
! -   Primorial prime from The Prime Glossary.
! -   Sequence A088411 from The On-Line Encyclopedia of Integer Sequences

USING: kernel lists lists.lazy math math.primes prettyprint
sequences ;

: pprime? ( n -- ? )
    nprimes product [ 1 + ] [ 1 - ] bi [ prime? ] either? ;

10 1 lfrom [ pprime? ] <lazy-filter> ltake list>array .
