! A Polyomino is a plane geometric figure formed by joining one or more
! equal squares edge to edge. Free polyominoes are distinct when none is a
! translation, rotation, reflection or glide reflection of another
! polyomino.
! 
! Task: generate all the free polyominoes with n cells.
! 
! You can visualize them just as a sequence of the coordinate pairs of
! their cells (rank 5):
! 
!     [(0, 0), (0, 1), (0, 2), (0, 3), (0, 4)]
!     [(0, 0), (0, 1), (0, 2), (0, 3), (1, 0)]
!     [(0, 0), (0, 1), (0, 2), (0, 3), (1, 1)]
!     [(0, 0), (0, 1), (0, 2), (1, 0), (1, 1)]
!     [(0, 0), (0, 1), (0, 2), (1, 0), (1, 2)]
!     [(0, 0), (0, 1), (0, 2), (1, 0), (2, 0)]
!     [(0, 0), (0, 1), (0, 2), (1, 1), (2, 1)]
!     [(0, 0), (0, 1), (0, 2), (1, 2), (1, 3)]
!     [(0, 0), (0, 1), (1, 1), (1, 2), (2, 1)]
!     [(0, 0), (0, 1), (1, 1), (1, 2), (2, 2)]
!     [(0, 0), (0, 1), (1, 1), (2, 1), (2, 2)]
!     [(0, 1), (1, 0), (1, 1), (1, 2), (2, 1)]
! 
! But a better basic visualization is using ASCII art (rank 5):
! 
!     #    ##   #    ##  ##  ###  #     #    #    #    #      #
!     #    #    ##   ##  #   #    ###   #    ###  ##   ###   ###
!     #    #    #    #   ##  #    #     ##    #    ##    #    #
!     #    #    #                        #
!     #
! 
! Or perhaps with corner characters (rank 5):
! 
!      ┌───┐   ┌─────┐     ┌─┐   ┌───┐   ┌───┐     ┌───┐     ┌───┐     ┌───┐   ┌─┐     ┌─────┐   ┌─┐     ┌─┐
!      │   │   │ ┌───┘   ┌─┘ │   │ ┌─┘   │ ┌─┘   ┌─┘ ┌─┘     │ ┌─┘   ┌─┘ ┌─┘   │ └─┐   └─┐ ┌─┘   │ │   ┌─┘ └─┐
!      │ ┌─┘   │ │       │ ┌─┘   │ │     │ └─┐   └─┐ │     ┌─┘ │     │ ┌─┘     │ ┌─┘     │ │     │ │   └─┐ ┌─┘
!      └─┘     └─┘       │ │     │ │     └───┘     └─┘     └───┘     └─┘       │ │       └─┘     │ │     └─┘
!                        └─┘     └─┘                                           └─┘               │ │
!                                                                                                └─┘
! 
! For a slow but clear solution see this Haskell Wiki page: Generating
! Polyominoes
! 
! Bonus Task: you can create an alternative program (or specialize your
! first program) to generate very quickly just the number of distinct free
! polyominoes, and to show a sequence like:
! 
! 1, 1, 1, 2, 5, 12, 35, 108, 369, 1285, 4655, 17073, 63600, 238591,
! 901971, 3426576, ...
! 
! Number of free polyominoes (or square animals) with n cells: OEIS:
! A000105
! 
! Cf.
! 
! Pentomino tiling


