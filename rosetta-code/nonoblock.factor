! Nonoblock is a chip off the old Nonogram puzzle.
! 
! Given:
! 
! -   The number of cells in a row.
! -   The size of each, (space separated), connected block of cells to fit
!     in the row, in left-to right order.
! 
! Task:
! 
! -   show all possible positions.
! -   show the number of positions of the blocks for the following cases
!     within the row.
! -   show all output on this page.
! -   use a "neat" diagram of the block positions.
! 
! Enumerate the following configurations:
! 
! 1.  5 cells and [2, 1] blocks
! 2.  5 cells and [] blocks (no blocks)
! 3.  10 cells and [8] blocks
! 4.  15 cells and [2, 3, 2, 3] blocks
! 5.  5 cells and [2, 3] blocks (should give some indication of this not
!     being possible)
! 
! Example:
! 
! Given a row of five cells and a block of two cells followed by a block
! of one cell - in that order, the example could be shown as:
! 
!    |_|_|_|_|_| # 5 cells and [2, 1] blocks
! 
! And would expand to the following 3 possible rows of block positions:
! 
!    |A|A|_|B|_|
!    |A|A|_|_|B|
!    |_|A|A|_|B|
! 
! Note how the sets of blocks are always separated by a space.
! 
! Note also that it is not necessary for each block to have a separate
! letter. Output approximating
! 
! This:
! 
!                        |#|#|_|#|_|
!                        |#|#|_|_|#|
!                        |_|#|#|_|#|
! 
! This would also work:
! 
!                        ##.#.
!                        ##..#
!                       .##.#
! 
! An algorithm:
! 
! -   Find the minimum space to the right that is needed to legally hold
!     all but the leftmost block of cells (with a space between blocks
!     remember).
! -   The leftmost cell can legitimately be placed in all positions from
!     the LHS up to a RH position that allows enough room for the rest of
!     the blocks.
! -   for each position of the LH block recursively compute the position
!     of the rest of the blocks in the remaining space to the right of the
!     current placement of the LH block.
! 
! (This is the algorithm used in the Nonoblock#Python solution).
! 
! Reference:
! 
! -   The blog post Nonogram puzzle solver (part 1) Inspired this task and
!     donated its Nonoblock#Python solution.

