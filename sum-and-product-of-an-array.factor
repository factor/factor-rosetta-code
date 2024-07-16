! Task:
! 
! Compute the sum and product of an array of integers.

: sum ( seq -- n ) 0 [ + ] reduce ;
: product ( seq -- n ) 1 [ * ] reduce ;
