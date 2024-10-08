! The purpose of this task is to create a version of an Elementary
! cellular automaton whose number of cells is only limited by the memory
! size of the computer.
! 
! To be precise, consider the state of the automaton to be made of an
! infinite number of cells, but with a bounded support. In other words, to
! describe the state of the automaton, you need a finite number of
! adjacent cells, along with their individual state, and you then consider
! that the individual state of each of all other cells is the negation of
! the closest individual cell among the previously defined finite number
! of cells.
! 
! Examples:
! 
!     1        ->   ..., 0, 0,      1,      0, 0, ...
!     0, 1     ->   ..., 1, 1,   0, 1,      0, 0, ...
!     1, 0, 1  ->   ..., 0, 0,   1, 0, 1,   0, 0, ...
! 
! More complex methods can be imagined, provided it is possible to somehow
! encode the infinite sections. But for this task we will stick to this
! simple version.


