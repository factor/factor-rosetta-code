! A pascal matrix is a two-dimensional square matrix holding numbers from
! Pascal's triangle, also known as binomial coefficients and which can be
! shown as ^(n)C_(r).
! 
! Shown below are truncated 5-by-5 matrices M[i, j] for i,j in range 0..4.
! 
! A Pascal upper-triangular matrix that is populated with ^(j)C_(i):
! 
!     [[1, 1, 1, 1, 1],
!      [0, 1, 2, 3, 4],
!      [0, 0, 1, 3, 6],
!      [0, 0, 0, 1, 4],
!      [0, 0, 0, 0, 1]]
! 
! A Pascal lower-triangular matrix that is populated with ^(i)C_(j) (the
! transpose of the upper-triangular matrix):
! 
!     [[1, 0, 0, 0, 0],
!      [1, 1, 0, 0, 0],
!      [1, 2, 1, 0, 0],
!      [1, 3, 3, 1, 0],
!      [1, 4, 6, 4, 1]]
! 
! A Pascal symmetric matrix that is populated with ^(i+j)C_(i):
! 
!     [[1, 1, 1, 1, 1],
!      [1, 2, 3, 4, 5],
!      [1, 3, 6, 10, 15],
!      [1, 4, 10, 20, 35],
!      [1, 5, 15, 35, 70]]
! 
! Task:
! 
! Write functions capable of generating each of the three forms of n-by-n
! matrices.
! 
! Use those functions to display upper, lower, and symmetric Pascal 5-by-5
! matrices on this page.
! 
! The output should distinguish between different matrices and the rows of
! each matrix (no showing a list of 25 numbers assuming the reader should
! split it into rows).
! 
! Note:
! 
! The Cholesky decomposition of a Pascal symmetric matrix is the Pascal
! lower-triangle matrix of the same size.

USING: arrays fry io kernel math math.combinatorics
math.matrices prettyprint sequences ;

: pascal ( n quot -- m )
    [ dup 2array <coordinate-matrix> ] dip
    '[ first2 @ nCk ] matrix-map ; inline

: lower ( n -- m ) [ ] pascal ;
: upper ( n -- m ) lower flip ;
: symmetric ( n -- m ) [ [ + ] keep ] pascal ;

5
[ lower "Lower:" ]
[ upper "Upper:" ]
[ symmetric "Symmetric:" ] tri
[ print simple-table. nl ] 2tri@
