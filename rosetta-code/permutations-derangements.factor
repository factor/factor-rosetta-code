! A derangement is a permutation of the order of distinct items in which
! no item appears in its original place.
! 
! For example, the only two derangements of the three items (0, 1, 2) are
! (1, 2, 0), and (2, 0, 1).
! 
! The number of derangements of n distinct items is known as the
! subfactorial of n, sometimes written as !n. There are various ways to
! calculate !n.
! 
! Task:
! 
! 1.  Create a named function/method/subroutine/... to generate
!     derangements of the integers 0..n-1, (or 1..n if you prefer).
! 2.  Generate and show all the derangements of 4 integers using the above
!     routine.
! 3.  Create a function that calculates the subfactorial of n, !n.
! 4.  Print and show a table of the counted number of derangements of n
!     vs. the calculated !n for n from 0..9 inclusive.
! 
! Optional stretch goal:
! 
! -   Calculate !20
! 
! Related tasks:
! 
! -   Anagrams/Deranged anagrams
! -   Best shuffle
! -   Left_factorials

USING: combinators formatting io kernel math math.combinatorics
prettyprint sequences ;
IN: rosetta-code.derangements

: !n ( n -- m )
    {
        { 0 [ 1 ] }
        { 1 [ 0 ] }
        [ [ 1 - !n ] [ 2 - !n + ] [ 1 - * ] tri ]
    } case ;

: derangements ( n -- seq )
    <iota> dup [ [ = ] 2map [ f = ] all? ] with
    filter-permutations ;

"4 derangements" print 4 derangements . nl
"n   count    calc\n=  ======  ======" print
10 <iota> [
    dup [ derangements length ] [ !n ] bi
    "%d%8d%8d\n" printf
] each nl
"!20 = " write 20 !n .
