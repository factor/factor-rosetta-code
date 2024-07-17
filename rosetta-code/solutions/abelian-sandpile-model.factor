! Implement the Abelian sandpile model also known as Bak–Tang–Wiesenfeld
! model. Its history, mathematical definition and properties can be found
! under its wikipedia article.
! 
! The task requires the creation of a 2D grid of arbitrary size on which
! "piles of sand" can be placed. Any "pile" that has 4 or more sand
! particles on it collapses, resulting in four particles being subtracted
! from the pile and distributed among its neighbors.
! 
! It is recommended to display the output in some kind of image format, as
! terminal emulators are usually too small to display images larger than a
! few dozen characters tall. As an example of how to accomplish this, see
! the Bitmap/Write a PPM file task.
! Examples up to 2^30, wow!
! javascript running on web
! Examples:
! 
!     0 0 0 0 0    0 0 0 0 0
!     0 0 0 0 0    0 0 1 0 0
!     0 0 4 0 0 -> 0 1 0 1 0
!     0 0 0 0 0    0 0 1 0 0
!     0 0 0 0 0    0 0 0 0 0
! 
!     0 0 0 0 0    0 0 0 0 0
!     0 0 0 0 0    0 0 1 0 0
!     0 0 6 0 0 -> 0 1 2 1 0
!     0 0 0 0 0    0 0 1 0 0
!     0 0 0 0 0    0 0 0 0 0
! 
!     0  0 0  0  0    0 0 1 0 0
!     0  0 0  0  0    0 2 1 2 0
!     0  0 16 0  0 -> 1 1 0 1 1
!     0  0 0  0  0    0 2 1 2 0
!     0  0 0  0  0    0 0 1 0 0


