! Task:
! 
! Shift list elements to left by 3.
! 
!       shift  = [1,2,3,4,5,6,7,8,9]
!       result = [4, 5, 6, 7, 8, 9, 1, 2, 3]

 USING: prettyprint sequences.extras ;

{ 1 2 3 4 5 6 7 8 9 } 3 rotate .
