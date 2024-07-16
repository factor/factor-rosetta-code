! The Game of Life is a cellular automaton devised by the British
! mathematician John Horton Conway in 1970. It is the best-known example
! of a cellular automaton.
! 
! Conway's game of life is described here:
! 
! A cell C is represented by a 1 when alive, or 0 when dead, in an m-by-m
! (or m×m) square array of cells.
! 
! We calculate N - the sum of live cells in C's eight-location
! neighbourhood, then cell C is alive or dead in the next generation based
! on the following table:
! 
!    C N new C
!    1   0,1             ->  0  # Lonely
!    1   4,5,6,7,8       ->  0  # Overcrowded
!    1   2,3             ->  1  # Lives
!    0   3               ->  1  # It takes three to give birth!
!    0   0,1,2,4,5,6,7,8 ->  0  # Barren
! 
! Assume cells beyond the boundary are always dead.
! 
! The "game" is actually a zero-player game, meaning that its evolution is
! determined by its initial state, needing no input from human players.
! One interacts with the Game of Life by creating an initial configuration
! and observing how it evolves.
! 
! Task:
! 
! Although you should test your implementation on more complex examples
! such as the glider in a larger universe, show the action of the blinker
! (three adjoining cells in a row all alive), over three generations, in a
! 3 by 3 grid.
! 
! References:
! 
! -   Its creator John Conway, explains the game of life. Video from
!     numberphile on youtube.
! -   John Conway Inventing Game of Life - Numberphile video.
! 
! Related task:
! 
! -   Langton's ant - another well known cellular automaton.

