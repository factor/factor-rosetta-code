! A magic square is a square grid containing consecutive integers from 1
! to N², arranged so that every row, column and diagonal adds up to the
! same number. That number is a constant. There is no way to create a
! valid N x N magic square that does not sum to the associated constant.
! 
! EG
! 
! A 3 x 3 magic square always sums to 15.
! 
!         ┌───┬───┬───┐
!         │ 2 │ 7 │ 6 │
!         ├───┼───┼───┤
!         │ 9 │ 5 │ 1 │
!         ├───┼───┼───┤
!         │ 4 │ 3 │ 8 │
!         └───┴───┴───┘
! 
! A 4 x 4 magic square always sums to 34.
! 
! Traditionally, the sequence leaves off terms for n = 0 and n = 1 as the
! magic squares of order 0 and 1 are trivial; and a term for n = 2 because
! it is impossible to form a magic square of order 2.
! 
! Task
! 
! -   Starting at order 3, show the first 20 magic constants.
! -   Show the 1000th magic constant. (Order 1003)
! -   Find and show the order of the smallest N x N magic square whose
!     constant is greater than 10¹ through 10¹⁰.
! 
! Stretch
! 
! -   Find and show the order of the smallest N x N magic square whose
!     constant is greater than 10¹¹ through 10²⁰.
! 
! See also
! 
! -   Wikipedia: Magic constant
! -   OEIS: A006003 (Similar sequence, though it includes terms for 0, 1 &
!     2.)
! -   Magic squares of odd order
! -   Magic squares of singly even order
! -   Magic squares of doubly even order

USING: formatting io kernel math math.functions.integer-logs
math.ranges prettyprint sequences ;

: magic ( m -- n ) dup sq 1 + 2 / * ;

"First 20 magic constants:" print
3 22 [a,b] [ bl ] [ magic pprint ] interleave nl
nl
"1000th magic constant: " write 1002 magic .
nl
"Smallest order magic square with a constant greater than:" print
1 0 20 [
    [ 10 * ] dip
    [ dup magic pick < ] [ 1 + ] while
    over integer-log10 over "10^%02d: %d\n" printf
    dup + 1 -
] times 2drop
