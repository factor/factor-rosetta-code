! Task:
! 
! Create a function which takes in a variable number of arguments and
! prints each one on its own line.
! 
! Also show, if possible in your language, how to call the function on a
! list of arguments constructed at runtime.
! 
! Functions of this type are also known as Variadic Functions.
! 
! Related task:
! 
! -   Call a function

MACRO: variadic-print ( n -- quot ) [ print ] n*quot ;
