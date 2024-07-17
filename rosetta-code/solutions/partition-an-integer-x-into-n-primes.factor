! Task:
! 
! Partition a positive integer X into N distinct primes.
! 
! Or, to put it in another way:
! 
! Find N unique primes such that they add up to X.
! 
! Show in the output section the sum X and the N primes in ascending order
! separated by plus (+) signs:
! 
!      •   partition  99809  with   1 prime.
!      •   partition    18   with   2 primes.
!      •   partition    19   with   3 primes.
!      •   partition    20   with   4 primes.
!      •   partition   2017  with  24 primes.
!      •   partition  22699  with   1,  2,  3,  and  4  primes.
!      •   partition  40355  with   3 primes.
! 
! The output could/should be shown in a format such as:
! 
!     Partitioned  19  with  3  primes:  3+5+11
! 
! -   -   Use any spacing that may be appropriate for the display.
!     -   You need not validate the input(s).
!     -   Use the lowest primes possible; use 18 = 5+13, not 18 = 7+11.
!     -   You only need to show one solution.
! 
! This task is similar to factoring an integer.
! 
! Related tasks:
! 
! -   -   Count in factors
!     -   Prime decomposition
!     -   Factors of an integer
!     -   Sieve of Eratosthenes
!     -   Primality by trial division
!     -   Factors of a Mersenne number
!     -   Factors of a Mersenne number
!     -   Sequence of primes by trial division

USING: formatting fry grouping kernel math.combinatorics
math.parser math.primes sequences ;

: partition ( x n -- str )
    over [ primes-upto ] 2dip '[ sum _ = ] find-combination
    [ number>string ] map "+" join ;
    
: print-partition ( x n seq -- )
    [ "no solution" ] when-empty
    "Partitioned %5d with %2d primes: %s\n" printf ;
    
{ 99809 1 18 2 19 3 20 4 2017 24 22699 1 22699 2 22699 3 22699
  4 40355 3 } 2 group
[ first2 2dup partition print-partition ] each
