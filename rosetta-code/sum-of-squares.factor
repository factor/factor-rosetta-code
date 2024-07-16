! Task:
! 
! Write a program to find the sum of squares of a numeric vector.
! 
! The program should work on a zero-length vector (with an answer of 0).
! 
! Related task:
! 
! -   Mean

USE: math sequences ;

: sum-of-squares ( seq -- n ) [ sq ] map-sum ;

{ 1.0 2.0 4.0 8.0 16.0 } sum-of-squares
