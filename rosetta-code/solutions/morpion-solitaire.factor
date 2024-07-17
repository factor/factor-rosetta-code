! Task Requirements
! 
! The task is to get the computer to play a game of Morpion solitaire. For
! this task, it is acceptable for the computer to make randomly selected
! valid moves, rather than playing the strongest move each time. Use the
! standard version, with 5 point lines that allows parallel lines to touch
! at the endpoints.
! 
! [A typical random game of "touching" (5T) morpion as rendered by
! Pentasol] (Proposed additional requirement): Provide sample output.
! Preferably the output should be a record of moves suitable for replay
! using Pentasol. Alternately, ASCII art can be used; however, games
! rendered in this manner may not provide enough information to replay the
! game. Please see the discussion on game notation and rendering for more
! information.
! 
! Playing Morpion Solitaire
! 
! There are several variations of the game, this task deals with the 5
! point "touching" version also known as "5T".
! 
! Morpion solitaire is played on a (theoretically) infinite grid. It
! begins with 36 points marked in a Greek cross:
! 
!     ...XXXX...
!     ...X..X...
!     ...X..X...
!     XXXX..XXXX
!     X........X
!     X........X
!     XXXX..XXXX
!     ...X..X...
!     ...X..X...
!     ...XXXX...
! 
! -   A move is made by adding one point anywhere that creates a new line
!     of 5 points (without spaces) and drawing a line through them. (Moves
!     are commonly marked with the number of the move for visual clarity.
!     Creating a record of the game in game notation is a better way to
!     validate a game.)
! -   Any two lines not running in the same direction may cross.
! -   Any two lines running in the same direction are allowed to touch at
!     the ends but not overlap (i.e. share at most a single point).
! -   The game ends when you run out of legal moves. (The game score is
!     the number of legal moves played.)
! 
! The rules to morpion solitaire are here.
! 
! Background
! 
! A short history of the 5T game:
! 
! -   170 - Bruneau, by hand in 1976
! -   117 and 122 - Juillé in 1995 and 1999
! -   143 - Zimmer in 2003
! -   144 - Cazenave in 2007
! -   172 - Rosin in 2010
! -   171 and 172 - Tishchenko in 2011
! -   177 and 178 - Rosin in 2011
! 
! For an up to date list of Morpion 5T Records see here. The shortest game
! possible is 20 moves.
! 
! The game is NP-hard in the general case and has a huge search space and
! is a test case for research into searching methods.
! 
! Theoretical bounds have been placed on the longest 5T game. The lower
! bound of 170 and upper bound of either 324 or 704 according to two
! different papers (see talk page).
! 
! __TOC__


