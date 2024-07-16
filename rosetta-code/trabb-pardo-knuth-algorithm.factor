! The TPK algorithm is an early example of a programming chrestomathy. It
! was used in Donald Knuth and Luis Trabb Pardo's Stanford tech report The
! Early Development of Programming Languages. The report traces the early
! history of work in developing computer languages in the 1940s and 1950s,
! giving several translations of the algorithm.
! 
! From the wikipedia entry:
! 
! ask for 11 numbers to be read into a sequence S
! reverse sequence S
! for each item in sequence S
!     result := call a function to do an operation
!     if result overflows
!         alert user
!     else
!         print result
! 
! The task is to implement the algorithm:
! 
! 1.  Use the function: f(x) = |x|^(0.5) + 5x³
! 2.  The overflow condition is an answer of greater than 400.
! 3.  The 'user alert' should not stop processing of other items of the
!     sequence.
! 4.  Print a prompt before accepting eleven, textual, numeric inputs.
! 5.  You may optionally print the item as well as its associated result,
!     but the results must be in reverse order of input.
! 6.  The sequence S may be 'implied' and so not shown explicitly.
! 7.  Print and show the program in action from a typical run here. (If
!     the output is graphical rather than text then either add a
!     screendump or describe textually what is displayed).

