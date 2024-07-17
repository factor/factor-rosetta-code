! Task:
! 
! Using two Arrays of equal length, create a Hash object where the
! elements from one array (the keys) are linked to the elements of the
! other (the values)
! 
! Related task:
! 
! -   Associative arrays/Creation
! 
! Category:Data Structures

USING: hashtables ;
{ "one" "two" "three" } { 1 2 3 } zip >hashtable
