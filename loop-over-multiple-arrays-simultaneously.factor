! Task:
! 
! Loop over multiple arrays (or lists or tuples or whatever they're called
! in your language) and display the i ^(th) element of each.
! 
! Use your language's "for each" loop if it has one, otherwise iterate
! through the collection in order with some other loop.
! 
! For this example, loop over the arrays:
! 
!     (a,b,c)
!     (A,B,C) 
!     (1,2,3) 
! 
! to produce the output:
! 
!     aA1
!     bB2
!     cC3
! 
! If possible, also describe what happens when the arrays are of different
! lengths.
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

"abc" "ABC" "123" [ [ write1 ] tri@ nl ] 
3each
