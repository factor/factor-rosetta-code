! Calculate the sequence where each term a_(n) is the smallest natural
! number greater than the previous term, that has exactly n divisors.
! 
! Task
! 
! Show here, on this page, at least the first 15 terms of the sequence.
! 
! See also
! 
! -   -   OEIS:A069654
! 
! Related tasks
! 
! -   -   Sequence: smallest number with exactly n divisors
!     -   Sequence: nth number with exactly n divisors‎‎

USING: io kernel math math.primes.factors prettyprint sequences ;

: next ( n num -- n' num' )
    [ 2dup divisors length = ] [ 1 + ] do until [ 1 + ] dip ;

: A069654 ( n -- seq )
    [ 2 1 ] dip [ [ next ] keep ] replicate 2nip ;

"The first 15 terms of the sequence are:" print 15 A069654 .
