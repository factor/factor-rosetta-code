! There is an n by m grid that has a random number (between 10% to 20% of
! the total number of tiles, though older implementations may use 20%..60%
! instead) of randomly placed mines that need to be found.
! 
! Positions in the grid are modified by entering their coordinates where
! the first coordinate is horizontal in the grid and the second vertical.
! The top left of the grid is position 1,1; the bottom right is at n,m.
! 
! -   The total number of mines to be found is shown at the beginning of
!     the game.
! -   Each mine occupies a single grid point, and its position is
!     initially unknown to the player
! -   The grid is shown as a rectangle of characters between moves.
! -   You are initially shown all grids as obscured, by a single dot '.'
! -   You may mark what you think is the position of a mine which will
!     show as a '?'
! -   You can mark what you think is free space by entering its
!     coordinates.
!     -   If the point is free space then it is cleared, as are any
!         adjacent points that are also free space- this is repeated
!         recursively for subsequent adjacent free points unless that
!         point is marked as a mine or is a mine.
!         -   Points marked as a mine show as a '?'.
!         -   Other free points show as an integer count of the number of
!             adjacent true mines in its immediate neighborhood, or as a
!             single space ' ' if the free point is not adjacent to any
!             true mines.
! -   Of course you lose if you try to clear space that has a hidden mine.
! -   You win when you have correctly identified all mines.
! 
! The Task is to create a program that allows you to play minesweeper on a
! 6 by 4 grid, and that assumes all user input is formatted correctly and
! so checking inputs for correct form may be omitted. You may also omit
! all GUI parts of the task and work using text input and output.
! 
! Note: Changes may be made to the method of clearing mines to more
! closely follow a particular implementation of the game so long as such
! differences and the implementation that they more accurately follow are
! described.
! 
! C.F: wp:Minesweeper (computer game)


