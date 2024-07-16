! Languages may have features for dealing specifically with empty strings
! (those containing no characters).
! 
! Task:
! 
! -   -   Demonstrate how to assign an empty string to a variable.
!     -   Demonstrate how to check that a string is empty.
!     -   Demonstrate how to check that a string is not empty.

USE: locals
[let
    "" :> empty-string
    empty-string empty? .
    empty-string empty? not .
]
