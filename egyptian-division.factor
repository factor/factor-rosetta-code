! Egyptian division is a method of dividing integers using addition and
! doubling that is similar to the algorithm of Ethiopian multiplication
! 
! Algorithm:
! 
! Given two numbers where the dividend is to be divided by the divisor:
! 
! 1.  Start the construction of a table of two columns: powers_of_2, and
!     doublings; by a first row of a 1 (i.e. 2^0) in the first column and
!     1 times the divisor in the first row second column.
! 2.  Create the second row with columns of 2 (i.e 2^1), and 2 * divisor
!     in order.
! 3.  Continue with successive i’th rows of 2^i and 2^i * divisor.
! 4.  Stop adding rows, and keep only those rows, where 2^i * divisor is
!     less than or equal to the dividend.
! 5.  We now assemble two separate sums that both start as zero, called
!     here answer and accumulator
! 6.  Consider each row of the table, in the reverse order of its
!     construction.
! 7.  If the current value of the accumulator added to the doublings cell
!     would be less than or equal to the dividend then add it to the
!     accumulator, as well as adding the powers_of_2 cell value to the
!     answer.
! 8.  When the first row has been considered as above, then the integer
!     division of dividend by divisor is given by answer.
! 
! (And the remainder is given by the absolute value of accumulator - dividend).
! 
! Example: 580 / 34
! 
! Table creation:
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings |- | 1 | 34 |- | 2 | 68 |- | 4 | 136 |- | 8 |
! 272 |- | 16 | 544 |}
! 
! Initialization of sums:
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 |
! 
! |
! 
! |- | 2 | 68 |
! 
! |
! 
! |- | 4 | 136 |
! 
! |
! 
! |- | 8 | 272 |
! 
! |
! 
! |- | 16 | 544 |
! 
! |
! 
! |- | | | 0 | 0 |}
! 
! Considering table rows, bottom-up:
! 
! When a row is considered it is shown crossed out if it is not
! accumulated, or bold if the row causes summations.
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 |
! 
! |
! 
! |- | 2 | 68 |
! 
! |
! 
! |- | 4 | 136 |
! 
! |
! 
! |- | 8 | 272 |
! 
! |
! 
! |- | 16 | 544 | 16 | 544 |}
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 |
! 
! |
! 
! |- | 2 | 68 |
! 
! |
! 
! |- | 4 | 136 |
! 
! |
! 
! |- | 8 | 272 | 16 | 544 |- | 16 | 544 |
! 
! |
! 
! |}
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 |
! 
! |
! 
! |- | 2 | 68 |
! 
! |
! 
! |- | 4 | 136 | 16 | 544 |- | 8 | 272 |
! 
! |
! 
! |- | 16 | 544 |
! 
! |
! 
! |}
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 |
! 
! |
! 
! |- | 2 | 68 | 16 | 544 |- | 4 | 136 |
! 
! |
! 
! |- | 8 | 272 |
! 
! |
! 
! |- | 16 | 544 |
! 
! |
! 
! |}
! 
!         {| class="wikitable"
! 
! ! powers_of_2 ! doublings ! answer ! accumulator |- | 1 | 34 | 17 | 578
! |- | 2 | 68 |
! 
! |
! 
! |- | 4 | 136 |
! 
! |
! 
! |- | 8 | 272 |
! 
! |
! 
! |- | 16 | 544 |
! 
! |
! 
! |}
! 
! Answer:
! 
! So 580 divided by 34 using the Egyptian method is 17 remainder (578 -
! 580) or 2.
! 
! Task:
! 
! The task is to create a function that does Egyptian division. The
! function should
! closely follow the description above in using a list/array of powers of
! two, and
! another of doublings.
! 
! -   Functions should be clear interpretations of the algorithm.
! -   Use the function to divide 580 by 34 and show the answer here, on
!     this page.
! 
! Related tasks:
! 
! -   -   Egyptian fractions
!     -   Ethiopian multiplication
! 
! References:
! 
! -   -   Egyptian Number System

USING: assocs combinators formatting kernel make math sequences ;
IN: rosetta-code.egyptian-division

: table ( dividend divisor -- table )
    [ [ 2dup >= ] [ dup , 2 * ] while ] { } make 2nip
    dup length <iota> [ 2^ ] map zip <reversed> ;

: accum ( a b dividend -- c )
    [ 2dup [ first ] bi@ + ] dip < [ [ + ] 2map ] [ drop ] if ;

: ediv ( dividend divisor -- quotient remainder )
    {
        [ table ]
        [ 2drop { 0 0 } ]
        [ drop [ accum ] curry reduce first2 swap ]
        [ drop - abs ] 
    } 2cleave ;

580 34 ediv "580 divided by 34 is %d remainder %d\n" printf
