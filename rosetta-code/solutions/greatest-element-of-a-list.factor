! Task:
! 
! Create a function that returns the maximum value in a provided set of
! values,
! 
! where the number of values may not be known until run-time.
! 
! Category:Simple

: supremum ( seq -- elt ) [ ] [ max ] map-reduce ;
