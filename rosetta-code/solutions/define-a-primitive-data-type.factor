! Demonstrate how to define a type that behaves like an integer but has a
! lowest valid value of 1 and a highest valid value of 10. Include all
! bounds checking you need to write, or explain how the compiler or
! interpreter creates those bounds checks for you.
! 
! Category:Type System

PREDICATE: my-int < integer [ 0 > ] [ 11 < ] bi and ;
