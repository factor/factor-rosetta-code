! Start with a value at 0. Loop while value mod 6 is not equal to 0. Each
! time through the loop, add 1 to the value then print it. The loop must
! execute at least once.
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
! Reference:
! 
! -   Do while loop Wikipedia.

0 [ dup 6 mod 0 = not ] [ [ . ] [ 1 + ] bi ] do while drop
