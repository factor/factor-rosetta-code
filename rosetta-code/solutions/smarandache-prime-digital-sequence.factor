! The Smarandache prime-digital sequence (SPDS for brevity) is the
! sequence of primes whose digits are themselves prime.
! 
! For example 257 is an element of this sequence because it is prime
! itself and its digits: 2, 5 and 7 are also prime.
! 
! Task
! 
! -   Show the first 25 SPDS primes.
! -   Show the hundredth SPDS prime.
! 
! See also:
! 
! -   OEIS A019546: Primes whose digits are primes.
! -   https://www.scribd.com/document/214851583/On-the-Smarandache-prime-digital-subsequence-sequences

USING: combinators.short-circuit io lists lists.lazy math
math.parser math.primes prettyprint sequences ;
IN: rosetta-code.smarandache-naive

: smarandache? ( n -- ? )
    {
        [ number>string string>digits [ prime? ] all? ]
        [ prime? ]
    } 1&& ;

: smarandache ( -- list ) 1 lfrom [ smarandache? ] lfilter ;

: smarandache-demo ( -- )
    "First 25 members of the Smarandache prime-digital sequence:"
    print 25 smarandache ltake list>array .
    "100th member: " write smarandache 99 [ cdr ] times car . ;

MAIN: smarandache-demo
