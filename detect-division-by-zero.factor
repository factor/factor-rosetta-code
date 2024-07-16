! Task:
! 
! Write a function to detect a divide by zero error without checking if
! the denominator is zero.

USE: math.floats.env

: try-div ( a b -- ) 
    '[ { +fp-zero-divide+ } [ _ _ /f . ] with-fp-traps ] try ;
