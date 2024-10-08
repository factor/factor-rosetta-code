! The task is to write a program which solves Hidato (aka Hidoku) puzzles.
! 
! The rules are:
! 
! -   You are given a grid with some numbers placed in it. The other
!     squares in the grid will be blank.
!     -   The grid is not necessarily rectangular.
!     -   The grid may have holes in it.
!     -   The grid is always connected.
!     -   The number “1” is always present, as is another number that is
!         equal to the number of squares in the grid. Other numbers are
!         present so as to force the solution to be unique.
!     -   It may be assumed that the difference between numbers present on
!         the grid is not greater than lucky 13.
! -   The aim is to place a natural number in each blank square so that in
!     the sequence of numbered squares from “1” upwards, each square is in
!     the wp:Moore neighborhood of the squares immediately before and
!     after it in the sequence (except for the first and last squares, of
!     course, which only have one-sided constraints).
!     -   Thus, if the grid was overlaid on a chessboard, a king would be
!         able to make legal moves along the path from first to last
!         square in numerical order.
!     -   A square may only contain one number.
! -   In a proper Hidato puzzle, the solution is unique.
! 
! For example the following problem [Sample Hidato problem, from
! Wikipedia]
! 
! has the following solution, with path marked on it:
! 
! [Solution to sample Hidato problem]
! 
! Related tasks:
! 
! -   A* search algorithm
! -   N-queens problem
! -   Solve a Holy Knight's tour
! -   Knight's tour
! -   Solve a Hopido puzzle
! -   Solve a Numbrix puzzle
! -   Solve the no connection puzzle;


