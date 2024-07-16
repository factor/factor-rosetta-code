! Some programming languages allow calculation of values at compile time.
! 
! Task:
! 
! Calculate 10! (ten factorial) at compile time.
! 
! Print the result when the program is run.
! 
! Discuss what limitations apply to compile-time calculations in your
! language.

: factorial ( n -- n! ) [1,b] product ;

CONSTANT: 10-factorial $[ 10 factorial ]
