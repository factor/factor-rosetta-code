! The Wave Function Collapse algorithm is a heuristic for generating tiled
! images.
! 
! The algorithm begins with a collection of equal sized image blocks and
! randomly places them, one at a time, within a grid subject to the tiling
! constraint and an entropy constraint, and it wraps (the top row of
! blocks in the grid is treated as adjacent to the bottom row of blocks,
! and similarly the left and right columns of blocks are treated as
! adjacent to each other).
! 
! The blocks are tiled within the grid. Tiled means they are placed with a
! one pixel overlap and the tiling constraint requires that the pixels
! overlapping border between two adjacent blocks match.
! 
! Entropy, here, means the number of blocks eligible to be placed in an
! unassigned grid location. The entropy constraint here is that each block
! is placed in a grid location with minimum entropy. (Placing a block may
! constrain the entropy of its four nearest neighbors -- up, down, left,
! right.)
! 
! For this task, we start with five blocks of 3x3 pixels and place them in
! an 8x8 grid to form a 17x17 tile. A tile is a block which may be tiled
! with itself. Here, we show these five blocks adjacent but not tiled:
! 
! Note that this algorithm sometimes does not succeed. If an unassigned
! grid location has an entropy of 0, the algorithm fails and returns an
! empty or null result. We'll ignore those failure cases for this task.
! 
! Reference WFC explained and another WFC explained


