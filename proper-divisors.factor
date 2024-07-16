! The proper divisors of a positive integer N are those numbers, other
! than N itself, that divide N without remainder.
! 
! For N > 1 they will always include 1, but for N == 1 there are no proper
! divisors.
! 
! Examples:
! 
! The proper divisors of 6 are 1, 2, and 3.
! 
! The proper divisors of 100 are 1, 2, 4, 5, 10, 20, 25, and 50.
! 
! Task:
! 
! 1.  Create a routine to generate all the proper divisors of a number.
! 2.  use it to show the proper divisors of the numbers 1 to 10 inclusive.
! 3.  Find a number in the range 1 to 20,000 with the most proper
!     divisors. Show the number and just the count of how many proper
!     divisors it has.
! 
! Show all output here.
! 
! Related tasks:
! 
! -   Amicable pairs
! -   Abundant, deficient and perfect number classifications
! -   Aliquot sequence classifications
! -   Factors of an integer
! -   Prime decomposition

USING: formatting io kernel math math.functions
math.primes.factors math.ranges prettyprint sequences ;

: #divisors ( m -- n )
    dup sqrt >integer 1 + [1,b] [ divisor? ] with count dup +
    1 - ;

10 [1,b] [ dup pprint bl divisors but-last . ] each
20000 [1,b] [ #divisors ] supremum-by dup #divisors
"%d with %d divisors.\n" printf
