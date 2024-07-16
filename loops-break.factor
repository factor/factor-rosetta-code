! Task:
! 
! Show a loop which prints random numbers (each number newly generated
! each loop) from 0 to 19 (inclusive).
! 
! If a number is 10, stop the loop after printing it, and do not generate
! any further numbers.
! 
! Otherwise, generate and print a second random number before restarting
! the loop.
! 
! If the number 10 is never generated as the first number in a loop, loop
! forever.
! 
! Related tasks:
! 
! -   Loop over multiple arrays simultaneously
! -   Loops/Break
! -   Loops/Continue
! -   Loops/Do-while
! -   Loops/Downward for
! -   Loops/For
! -   Loops/For with a specified step
! -   Loops/Foreach
! -   Loops/Increment loop index within loop body
! -   Loops/Infinite
! -   Loops/N plus one half
! -   Loops/Nested
! -   Loops/While
! -   Loops/with multiple ranges

[ 20 random [ . ] [ 10 = not ] bi dup [ 20 random . ] when ] loop
