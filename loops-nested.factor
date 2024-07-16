! Show a nested loop which searches a two-dimensional array filled with
! random numbers uniformly distributed over [1, …, 20].
! 
! The loops iterate rows and columns of the array printing the elements
! until the value 20 is met.
! 
! Specifically, this task also shows how to break out of nested loops.
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
! -   Loops/Wrong ranges

USING: continuations io kernel math.ranges prettyprint random
sequences ;

10 [ 20 [ 20 [1,b] random ] replicate ] replicate             ! make a table of random values
[
    [ [ dup pprint bl 20 = [ return ] when ] each nl ] each   ! print values until 20 is found
] with-return drop
