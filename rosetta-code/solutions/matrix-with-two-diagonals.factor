! Task:
! 
! Draw a square matrix which has 1's on both diagonals but 0's elsewhere.
! 
! If you can please use GUI
! 
! See also
! 
! -   Four sides of square
! -   Mosaic matrix

USING: io kernel math math.matrices prettyprint ;

: <x-matrix> ( n -- matrix )
    dup dup 1 - '[ 2dup = -rot + _ = or 1 0 ? ] <matrix-by-indices> ;

6 <x-matrix> simple-table. nl
7 <x-matrix> simple-table.
