! Task:
! 
! Write a program which counts up from 1, displaying each number as the
! multiplication of its prime factors.
! 
! For the purpose of this task, 1 (unity) may be shown as itself.
! 
! Example:
! 
!   2  is prime,  so it would be shown as itself. 
! 
!   6  is not prime;  it would be shown as  2 × 3. 
! 
! 2144 is not prime; it would be shown as 2 × 2 × 2 × 2 × 2 × 67.
! 
! Related tasks:
! 
! -   prime decomposition
! -   factors of an integer
! -   Sieve of Eratosthenes
! -   primality by trial division
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes

USING: io kernel math.primes.factors math.ranges prettyprint
sequences ;

: .factors ( n -- )
    dup pprint ": " write factors
    [ " × " write ] [ pprint ] interleave nl ;

"1: 1" print 2 20 [a,b] [ .factors ] each
