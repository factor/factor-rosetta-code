! Definition
! 
! A positive integer n is an arithmetic number if the average of its
! positive divisors is also an integer.
! 
! Clearly all odd primes p must be arithmetic numbers because their only
! divisors are 1 and p whose sum is even and hence their average must be
! an integer. However, the prime number 2 is not an arithmetic number
! because the average of its divisors is 1.5.
! 
! Example
! 
! 30 is an arithmetic number because its 7 divisors are: [1, 2, 3, 5, 6,
! 10, 15, 30], their sum is 72 and average 9 which is an integer.
! 
! Task
! 
! Calculate and show here:
! 
! 1. The first 100 arithmetic numbers.
! 
! 2. The xth arithmetic number where x = 1,000 and x = 10,000.
! 
! 3. How many of the first x arithmetic numbers are composite.
! 
! Note that, technically, the arithmetic number 1 is neither prime nor
! composite.
! 
! Stretch
! 
! Carry out the same exercise in 2. and 3. above for x = 100,000 and x =
! 1,000,000.
! 
! References
! 
! -   Wikipedia: Arithmetic number
! -   OEIS:A003601 - Numbers n such that the average of the divisors of n
!     is an integer

USING: combinators formatting grouping io kernel lists
lists.lazy math math.functions math.primes math.primes.factors
math.statistics math.text.english prettyprint sequences
tools.memory.private ;

: arith? ( n -- ? ) divisors mean integer? ;
: larith ( -- list ) 1 lfrom [ arith? ] lfilter ;
: arith ( m -- seq ) larith ltake list>array ;
: composite? ( n -- ? ) dup 1 > swap prime? not and ;
: ordinal ( n -- str ) [ commas ] keep ordinal-suffix append ;

: info. ( n -- )
    {
        [ ordinal "%s arithmetic number: " printf ]
        [ arith dup last commas print ]
        [ commas "Number of composite arithmetic numbers <= %s: " printf ]
        [ drop [ composite? ] count commas print nl ]
    } cleave ;


"First 100 arithmetic numbers:" print
100 arith 10 group simple-table. nl
{ 3 4 5 6 } [ 10^ info. ] each
