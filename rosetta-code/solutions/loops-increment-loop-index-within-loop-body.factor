! Sometimes, one may need (or want) a loop which its iterator (the index
! variable) is modified within the
! 
! loop body in addition to the normal incrementation by the (do) loop
! structure index.
! 
! Goal:
! 
! Demonstrate the best way to accomplish this.
! 
! Task:
! 
! Write a loop which:
! 
! -   -   starts the index (variable) at 42
!     -   (at iteration time) increments the index by unity
!     -   if the index is prime:
!         -   -   displays the count of primes found (so far) and the
!                 prime (to the terminal)
!             -   increments the index such that the new index is now the
!                 (old) index plus that prime
!     -   terminates the loop when 42 primes are shown
! 
! Extra credit: because of the primes get rather large, use commas within
! the displayed primes to ease comprehension.
! 
! Show all output here.
! 
! Note:
! 
! Not all programming languages allow the modification of a loop's index.
! If that is the case, then use whatever method that is appropriate or
! idiomatic for that language. Please add a note if the loop's index isn't
! modifiable.
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
! -   Loops/Infinite
! -   Loops/N plus one half
! -   Loops/Nested
! -   Loops/While
! -   Loops/with multiple ranges
! -   Loops/Wrong ranges
! 
! Category:Simple

USING: formatting kernel math math.primes
tools.memory.private ;
IN: rosetta-code.loops-inc-body

42
0
[ dup 42 < ] [
    over prime? [
        1 + 2dup swap commas
        "n = %-2d  %19s\n" printf
        [ dup + 1 - ] dip
    ] when
    [ 1 + ] dip
] while
2drop
