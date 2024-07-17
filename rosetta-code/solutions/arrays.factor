! This task is about arrays.
! 
! For hashes or associative arrays, please see Creating an Associative
! Array.
! 
! For a definition and in-depth discussion of what an array is, see Array.
! 
! Task:
! 
! Show basic array syntax in your language.
! 
! Basically, create an array, assign a value to it, and retrieve an
! element (if available, show both fixed-length arrays and dynamic arrays,
! pushing a value into it).
! 
! Please discuss at Village Pump: .
! 
! Please merge code in from these obsolete tasks:
! 
! -   -   Creating an Array
!     -   Assigning Values to an Array
!     -   Retrieving an Element of an Array
! 
! Related tasks:
! 
! -   Collections
! -   Creating an Associative Array
! -   Two-dimensional array (runtime)

{ 1 2 3 }
{ 
  [ "The initial array: " write . ]
  [ [ 42 1 ] dip set-nth ]
  [ "Modified array: " write . ]
  [ "The element we modified: " write [ 1 ] dip nth . ]
} cleave
