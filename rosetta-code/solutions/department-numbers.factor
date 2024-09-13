! There is a highly organized city that has decided to assign a number to
! each of their departments:
! 
! -   -   police department
!     -   sanitation department
!     -   fire department
! 
! Each department can have a number between 1 and 7 (inclusive).
! 
! The three department numbers are to be unique (different from each
! other) and must add up to 12.
! 
! The Chief of the Police doesn't like odd numbers and wants to have an
! even number for his department.
! 
! Task:
! 
! Write a computer program which outputs all valid combinations.
! 
! Possible output (for the 1^(st) and 14^(th) solutions):
! 
!  --police--  --sanitation--  --fire-- 
!      2             3            7 
!      6             5            1
! 
! Category:Puzzles

USING: formatting io kernel math math.combinatorics math.ranges
sequences sets ;
IN: rosetta-code.department-numbers

7 [1,b] 3 <k-permutations>
[ [ first even? ] [ sum 12 = ] bi and ] filter

"{ Police, Sanitation, Fire }" print nl
[ "%[%d, %]\n" printf ] each
