! Related tasks:
! 
! -   Arrays
!     -   Array
!     -   Sum and product of an array
!     -   Collections
!     -   Creating an Associative Array
!     -   Two-dimensional array (runtime)
! -   Vector
! -   Matrices
! -   Bivector
! -   Antivector
! -   Tensor
! -   Quaternion
! -   Rotor
! -   Motor
! -   Sedenion
! -   Octonion
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
! -   Creating an Array
! -   Assigning Values to an Array
! -   Retrieving an Element of an Array
! 
! Category:Simple

{ 1 2 3 }
{ 
  [ "The initial array: " write . ]
  [ [ 42 1 ] dip set-nth ]
  [ "Modified array: " write . ]
  [ "The element we modified: " write [ 1 ] dip nth . ]
} cleave

V{ 1 2 3 }
{ 
  [ "The initial vector: " write . ]
  [ [ 42 ] dip push ]
  [ "Modified vector: " write . ]
} cleave
