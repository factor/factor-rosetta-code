! Task:
! 
! Produce a sequential count in octal, starting at zero, and using an
! increment of a one for each consecutive number.
! 
! Each number should appear on a single line, and the program should count
! until terminated, or until the maximum value of the numeric type in use
! is reached.
! 
! Related task:
! 
! -   Integer sequence is a similar task without the use of octal numbers.
! 
! Category:Radices Category:Iteration

USING: kernel math prettyprint ;
0 [ dup .o 1 + t ] loop
