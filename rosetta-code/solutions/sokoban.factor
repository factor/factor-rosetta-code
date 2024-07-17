! Demonstrate how to find a solution to a given Sokoban level. For the
! purpose of this task (formally, a PSPACE-complete problem) any method
! may be used. However a move-optimal or push-optimal (or any other
! -optimal) solutions is preferred.
! 
! Sokoban levels are usually stored as a character array where
! 
! -   space is an empty square
! -   # is a wall
! -   @ is the player
! -   $ is a box
! -   . is a goal
! -   + is the player on a goal
! -   * is a box on a goal
! 
!     #######
!     #     #
!     #     #
!     #. #  #
!     #. $$ #
!     #.$$  #
!     #.#  @#
!     #######
! 
! Sokoban solutions are usually stored in the LURD format, where lowercase
! l, u, r and d represent a move in that (left, up, right, down) direction
! and capital LURD represents a push.
! 
! Please state if you use some other format for either the input or
! output, and why.
! 
! For more information, see the Sokoban wiki.


