! Task:
! 
! The goal is to create an associative array (also known as a dictionary,
! map, or hash).
! 
! Related tasks:
! 
! -   Associative arrays/Iteration
! -   Hash from two arrays

H{ { "one" 1 } { "two" 2 } }
{ [ "one" swap at . ]
  [ 2 swap value-at . ]
  [ "three" swap at . ]
  [ [ 3 "three" ] dip set-at ]
  [ "three" swap at . ] } cleave
