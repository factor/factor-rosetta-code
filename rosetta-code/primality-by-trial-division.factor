! Task:
! 
! Write a boolean function that tells whether a given integer is prime.
! 
! Remember that 1 and all non-positive numbers are not prime.
! 
! Use trial division.
! 
! Even numbers greater than 2 may be eliminated right away.
! 
! A loop from 3 to √   will suffice, but other loops are allowed.
! 
! Related tasks:
! 
! -   count in factors
! -   prime decomposition
! -   AKS test for primes
! -   factors of an integer
! -   Sieve of Eratosthenes
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes
! -   sequence of primes by Trial Division

USING: combinators kernel math math.functions math.ranges sequences ;

: prime? ( n -- ? )
    {
        { [ dup 2 < ] [ drop f ] }
        { [ dup even? ] [ 2 = ] }
        [ 3 over sqrt 2 <range> [ mod 0 > ] with all? ]
    } cond ;
