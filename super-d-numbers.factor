! A super-d number is a positive, decimal (base ten) integer n such that d
! × n^(d) has at least d consecutive digits d where
! 
!    2 ≤ d ≤ 9
! 
! For instance, 753 is a super-3 number because 3 × 753³ = 1280873331.
! 
! Super-d numbers are also shown on MathWorld™ as super-d or super-d.
! 
! Task:
! 
! -   -   Write a function/procedure/routine to find super-d numbers.
!     -   For d=2 through d=6, use the routine to show the first 10
!         super-d numbers.
! 
! Extra credit:
! 
! -   -   Show the first 10 super-7, super-8, and/or super-9 numbers
!         (optional).
! 
! See also:
! 
! -   -   Wolfram MathWorld - Super-d Number.
!     -   OEIS: A014569 - Super-3 Numbers.

USING: arrays formatting io kernel lists lists.lazy math
math.functions math.ranges math.text.utils prettyprint sequences
;
IN: rosetta-code.super-d

: super-d? ( seq n d -- ? ) tuck ^ * 1 digit-groups subseq? ;

: super-d ( d -- list )
    [ dup <array> ] [ drop 1 lfrom ] [ ] tri [ super-d? ] curry
    with lfilter ;

: super-d-demo ( -- )
    10 2 6 [a,b] [
        dup "First 10 super-%d numbers:\n" printf
        super-d ltake list>array [ pprint bl ] each nl nl
    ] with each ;

MAIN: super-d-demo
