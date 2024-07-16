! Task:
! 
! Produce a spiral array.
! 
! A spiral array is a square arrangement of the first N² natural numbers,
! where the
! 
! numbers increase sequentially as you go around the edges of the array
! spiraling inwards.
! 
! For example, given 5, produce this array:
! 
!      0  1  2  3  4
!     15 16 17 18  5
!     14 23 24 19  6
!     13 22 21 20  7
!     12 11 10  9  8
! 
! Related tasks:
! 
! -   Zig-zag matrix
! -   Identity_matrix
! -   Ulam_spiral_(for_primes)

USING: arrays grouping io kernel math math.combinatorics
math.ranges math.statistics prettyprint sequences
sequences.repeating ;
IN: rosetta-code.spiral-matrix

: counts ( n -- seq ) 1 [a,b] 2 repeat rest ;

: vals ( n -- seq )
    [ 1 swap 2dup [ neg ] bi@ 4array ] [ 2 * 1 - cycle ] bi ;

: evJKT2 ( n -- seq )
    [ counts ] [ vals ] bi [ <array> ] 2map concat ;

: spiral ( n -- matrix )
    [ evJKT2 cum-sum inverse-permutation ] [ group ] bi ;

: spiral-demo ( -- ) 5 9 [ spiral simple-table. nl ] bi@ ;

MAIN: spiral-demo
