! Task
! 
! Write a program to find the mean (arithmetic average) of a numeric
! vector.
! 
! In case of a zero-length input, since the mean of an empty set of
! numbers is ill-defined, the program may choose to behave in any way it
! deems appropriate, though if the programming language has an established
! convention for conveying math errors or undefined values, it's
! preferable to follow it.
! 
! Category:Arithmetic Category:Simple

USING: math math.statistics ;

: arithmetic-mean ( seq -- n )
    [ 0 ] [ mean ] if-empty ;
