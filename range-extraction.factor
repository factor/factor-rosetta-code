! Task:
! 
! -   Create a function that takes a list of integers in increasing order
!     and returns a correctly formatted string in the range format.
! -   Use the function to compute and print the range formatted version of
!     the following ordered list of integers. (The correct answer is:
!     0-2,4,6-8,11,12,14-25,27-33,35-39).
! 
!     0,  1,  2,  4,  6,  7,  8, 11, 12, 14,
!    15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
!    25, 27, 28, 29, 30, 31, 32, 33, 35, 36,
!    37, 38, 39
! 
! -   Show the output of your program.
! 
! Related task:
! 
! -   Range expansion

USING: formatting io kernel math math.parser sequences
splitting.monotonic ;
IN: rosetta-code.range-extraction

: make-range ( seq -- str )
    [ first ] [ last ] bi "%d-%d" sprintf ;
    
: make-atomic ( seq -- str ) [ number>string ] map "," join ;

: extract-range ( seq -- str )
    [ - -1 = ] monotonic-split
    [ dup length 2 > [ make-range ] [ make-atomic ] if ] map
    "," join ;
    
{
    0 1 2 4 6 7 8 11 12 14 15 16 17 18 19 20 21 22
    23 24 25 27 28 29 30 31 32 33 35 36 37 38 39
} extract-range print
