! Task:
! 
! Show how to compute the reduced row echelon form (a.k.a. row canonical
! form) of a matrix.
! 
! The matrix can be stored in any datatype that is convenient (for most
! languages, this will probably be a two-dimensional array).
! 
! Built-in functions or this pseudocode (from Wikipedia) may be used:
! 
! function ToReducedRowEchelonForm(Matrix M) is
!     lead := 0
!     rowCount := the number of rows in M
!     columnCount := the number of columns in M
!     for 0 ≤ r < rowCount do
!         if columnCount ≤ lead then
!             stop
!         end if
!         i = r
!         while M[i, lead] = 0 do
!             i = i + 1
!             if rowCount = i then
!                 i = r
!                 lead = lead + 1
!                 if columnCount = lead then
!                     stop
!                 end if
!             end if
!         end while
!         Swap rows i and r
!         If M[r, lead] is not 0 divide row r by M[r, lead]
!         for 0 ≤ i < rowCount do
!             if i ≠ r do
!                 Subtract M[i, lead] multiplied by row r from row i
!             end if
!         end for
!         lead = lead + 1
!     end for
! end function
! 
! For testing purposes, the RREF of this matrix:
! 
!      1    2   -1   -4
!      2    3   -1   -11
!     -2    0   -3    22
! 
! is:
! 
!      1    0    0   -8
!      0    1    0    1
!      0    0    1   -2

USE: math.matrices.elimination
{ { 1 2 -1 -4 } { 2 3 -1 -11 } { -2 0 -3 22 } } solution .
