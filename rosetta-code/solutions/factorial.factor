! Definitions:
! 
! -   -   The factorial of 0 (zero) is defined as being 1 (unity).
!     -   The Factorial Function of a positive integer, n, is defined as
!         the product of the sequence:
! 
!                  n,  n-1,  n-2,  ...  1 
! 
! Task:
! 
! Write a function to return the factorial of a number.
! 
! Solutions can be iterative or recursive.
! 
! Support for trapping negative n errors is optional.
! 
! Related task:
! 
! -   Primorial numbers
! 
! Category:Recursion Category:Memoization Category:Classic CS problems and
! programs Category:Arithmetic Category:Simple

USING: math.ranges sequences ;

: factorial ( n -- n ) [1,b] product ;
