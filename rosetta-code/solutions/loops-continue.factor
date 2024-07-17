! Task:
! 
! Show the following output using one loop.
! 
! 1, 2, 3, 4, 5
! 6, 7, 8, 9, 10
! 
! Try to achieve the result by forcing the next iteration within the loop
! upon a specific condition, if your language allows it.
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
! 
! Category:Loop modifiers

1 10 [a,b] [ 
    [ number>string write ]
    [ 5 mod 0 = "\n" ", " ? write ] bi
] each
