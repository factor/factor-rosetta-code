! Calculate the sequence where each term a_(n) is the smallest natural
! number that has exactly n divisors.
! 
! Task
! 
! Show here, on this page, at least the first 15 terms of the sequence.
! 
! Related tasks:
! 
! -   -   Sequence: smallest number greater than previous term with
!         exactly n divisors
!     -   Sequence: nth number with exactly n divisors‎‎
! 
! See also:
! 
! -   -   OEIS:A005179

USING: fry kernel lists lists.lazy math math.primes.factors
prettyprint sequences ;

: A005179 ( -- list )
    1 lfrom [
        1 swap '[ dup divisors length _ = ] [ 1 + ] until
    ] lmap-lazy ;

15 A005179 ltake list>array .
