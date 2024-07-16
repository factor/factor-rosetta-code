! Quite often one needs loops which, in the last iteration, execute only
! part of the loop body.
! 
! Goal:
! 
! Demonstrate the best way to do this.
! 
! Task:
! 
! Write a loop which writes the comma-separated list
! 
! 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
! 
! using separate output statements for the number and the comma from
! within the body of the loop.
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

: print-comma-list ( n -- )
    [ [1,b] ] keep '[
        [ number>string write ]
        [ _ = [ ", " write ] unless ] bi
    ] each nl ;
