! When a number is written in base 10, adjacent digits may "rise" or
! "fall" as the number is read (usually from left to right).
! 
! Definition:
! 
! Given the decimal digits of the number are written as a series d:
! 
! -   -   A rise is an index i such that d(i) < d(i+1)
!     -   A fall is an index i such that d(i) > d(i+1)
! 
! Examples:
! 
! -   -   The number 726,169 has 3 rises and 2 falls, so it isn't in the
!         sequence.
!     -   The number 83,548 has 2 rises and 2 falls, so it is in the
!         sequence.
! 
! Task:
! 
! -   -   Print the first 200 numbers in the sequence
!     -   Show that the 10 millionth (10,000,000^(th)) number in the
!         sequence is 41,909,002
! 
! See also:
! 
! -   OEIS Sequence A296712 describes numbers whose digit sequence in base
!     10 have equal "rises" and "falls".
! 
! Related tasks:
! 
! -   Esthetic numbers

USING: grouping io kernel lists lists.lazy math math.extras
prettyprint tools.memory.private ;

: rises-and-falls-equal? ( n -- ? )
    0 swap 10 /mod swap
    [ 10 /mod rot over - sgn rotd + spin ] until-zero drop 0 = ;

: OEIS:A296712 ( -- list )
    1 lfrom [ rises-and-falls-equal? ] lfilter ;

! Task
"The first 200 numbers in OEIS:A296712 are:" print
200 OEIS:A296712 ltake list>array 20 group simple-table. nl

"The 10 millionth number in OEIS:A296712 is " write
9,999,999 OEIS:A296712 lnth commas print
