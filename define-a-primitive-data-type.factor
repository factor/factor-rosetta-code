! Demonstrate how to define a type that behaves like an integer but has a
! lowest valid value of 1 and a highest valid value of 10. Include all
! bounds checking you need to write, or explain how the compiler or
! interpreter creates those bounds checks for you.

GENERIC: ++ ( m -- n )
M: integer ++ 1 + ;
M: my-int ++ 2/ ;

10 ++ ! 5
11 ++ ! 12
