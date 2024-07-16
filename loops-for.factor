! “For” loops are used to make some block of code be iterated a number of
! times, setting a variable or parameter to a monotonically increasing
! integer value for each execution of the block of code.
! 
! Common extensions of this allow other counting patterns or iterating
! over abstract structures other than the integers.
! 
! Task:
! 
! Show how two loops may be nested within each other, with the number of
! iterations performed by the inner for loop being controlled by the outer
! for loop.
! 
! Specifically print out the following pattern by using one for loop
! nested in another:
! 
!     *
!     **
!     ***
!     ****
!     *****
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
! -   For loop Wikipedia.

5 [1,b] [ [ "*" write ] times nl ] each
