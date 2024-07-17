! A Curzon number is defined to be a positive integer n for which 2^(n) +
! 1 is evenly divisible by 2 × n + 1.
! 
! Generalized Curzon numbers are those where the positive integer n, using
! a base integer k, satisfy the condition that k^(n) + 1 is evenly
! divisible by k × n + 1.
! 
! Base here does not imply the radix of the counting system; rather the
! integer the equation is based on. All calculations should be done in
! base 10.
! 
! Generalized Curzon numbers only exist for even base integers.
! 
! Task
! 
! -   Find and show the first 50 Generalized Curzon numbers for even base
!     integers from 2 through 10.
! 
! Stretch
! 
! -   Find and show the one thousandth.
! 
! See also
! 
! * Numbers Aplenty - Curzon numbers
! * OEIS:A224486 - Numbers k such that 2*k+1 divides 2^k+1 (Curzon numbers)
! 
! and even though it is not specifically mentioned that they are Curzon
! numbers:
! 
! * OEIS:A230076 - (A007521(n)-1)/4 (Generalized Curzon numbers with a base 4)

USING: grouping interpolate io kernel make math math.functions
prettyprint ranges sequences ;

: curzon? ( k n -- ? ) [ ^ 1 + ] 2keep * 1 + divisor? ;

: next ( k n -- k n' ) [ 2dup curzon? ] [ 1 + ] do until ;

: curzon ( k -- seq )
    1 [ 50 [ dup , next ] times ] { } make 2nip ;

: curzon. ( k -- )
    dup [I Curzon numbers with base ${}:I] nl
    curzon 10 group simple-table. ;

2 10 2 <range> [ curzon. nl ] each
