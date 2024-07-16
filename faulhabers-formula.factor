! In mathematics, Faulhaber's formula, named after Johann Faulhaber,
! expresses the sum of the p-th powers of the first n positive integers as
! a (p + 1)th-degree polynomial function of n, the coefficients involving
! Bernoulli numbers.
! 
! Task:
! 
! Generate the first 10 closed-form expressions, starting with p = 0.
! 
! Related tasks:
! 
! -   -   Bernoulli numbers.
!     -   evaluate binomial coefficients.
! 
! See also:
! 
! -   -   The Wikipedia entry: Faulhaber's formula.
!     -   The Wikipedia entry: Bernoulli numbers.
!     -   The Wikipedia entry: binomial coefficients.

USING: formatting kernel math math.combinatorics math.extras
math.functions regexp sequences ;

: faulhaber ( p -- seq )
    1 + dup recip swap dup <iota>
    [ [ nCk ] [ -1 swap ^ ] [ bernoulli ] tri * * * ] 2with map ;

: (poly>str) ( seq -- str )
    reverse [ 1 + "%un^%d" sprintf ] map-index reverse " + " join ;

: clean-up ( str -- str' )
    R/ n\^1\z/ "n" re-replace            ! Change n^1 to n.
    R/ 1n/ "n" re-replace                ! Change 1n to n.
    R/ \+ -/ "- " re-replace             ! Change + - to - .
    R/ [+-] 0n(\^\d+ )?/ "" re-replace ; ! Remove terms of zero.

: poly>str ( seq -- str ) (poly>str) clean-up ;

10 [ dup faulhaber poly>str "%d: %s\n" printf ] each-integer
