! Task:
! 
! Find all primes in which all substrings (in base ten) are also primes.
! 
! This can be achieved by filtering all primes below 500 (there are 95 of
! them), but there are better ways.
! 
! Advanced:
! 
! Solve by testing at most 15 numbers for primality. Show a list of all
! numbers tested that were not prime.
! 
! Category:Prime Numbers

USING: combinators kernel math math.primes prettyprint sequences ;

:: ssp? ( n -- ? )
    {
        { [ n prime? not ] [ f ] }
        { [ n 10 < ] [ t ] }
        { [ n 100 mod prime? not ] [ f ] }
        { [ n 10 mod prime? not ] [ f ] }
        { [ n 10 /i prime? not ] [ f ] }
        { [ n 100 < ] [ t ] }
        { [ n 100 /i prime? not ] [ f ] }
        { [ n 100 mod 10 /i prime? not ] [ f ] }
        [ t ]
    } cond ;

500 <iota> [ ssp? ] filter .
