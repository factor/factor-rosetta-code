! Task:
! 
! Compute the sum and product of an array of integers.
! 
! Related task:
! 
! -   Array
! -   Arrays
! -   Vector
! -   Dot product
! -   Vector products
! 
! Category:Iteration

1 5 1 <range> [ sum . ] [ product . ] bi
    15 120
{ 1 2 3 4 } [ sum ] [ product ] bi
    10 24

: sum ( seq -- n ) 0 [ + ] reduce ;
: product ( seq -- n ) 1 [ * ] reduce ;
