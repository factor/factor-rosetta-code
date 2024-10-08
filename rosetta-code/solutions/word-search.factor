! A word search puzzle typically consists of a grid of letters in which
! words are hidden.
! 
! There are many varieties of word search puzzles. For the task at hand we
! will use a rectangular grid in which the words may be placed
! horizontally, vertically, or diagonally. The words may also be spelled
! backwards.
! 
! The words may overlap but are not allowed to zigzag, or wrap around.
! 
! Task
! 
! Create a 10 by 10 word search and fill it using words from the unixdict.
! Use only words that are longer than 2, and contain no non-alphabetic
! characters.
! 
! The cells not used by the hidden words should contain the message:
! Rosetta Code, read from left to right, top to bottom. These letters
! should be somewhat evenly distributed over the grid, not clumped
! together. The message should be in upper case, the hidden words in lower
! case. All cells should either contain letters from the hidden words or
! from the message.
! 
! Pack a minimum of 25 words into the grid.
! 
! Print the resulting grid and the solutions.
! 
! Example
! 
!          0  1  2  3  4  5  6  7  8  9
! 
!     0    n  a  y  r  y  R  e  l  m  f 
!     1    y  O  r  e  t  s  g  n  a  g 
!     2    t  n  e  d  i  S  k  y  h  E 
!     3    n  o  t  n  c  p  c  w  t  T 
!     4    a  l  s  u  u  n  T  m  a  x 
!     5    r  o  k  p  a  r  i  s  h  h 
!     6    a  A  c  f  p  a  e  a  c  C 
!     7    u  b  u  t  t  t  O  l  u  n 
!     8    g  y  h  w  a  D  h  p  m  u 
!     9    m  i  r  p  E  h  o  g  a  n 
! 
!     parish     (3,5)(8,5)   gangster   (9,1)(2,1)
!     paucity    (4,6)(4,0)   guaranty   (0,8)(0,1)
!     prim       (3,9)(0,9)   huckster   (2,8)(2,1)
!     plasm      (7,8)(7,4)   fancy      (3,6)(7,2)
!     hogan      (5,9)(9,9)   nolo       (1,2)(1,5)
!     under      (3,4)(3,0)   chatham    (8,6)(8,0)
!     ate        (4,8)(6,6)   nun        (9,7)(9,9)
!     butt       (1,7)(4,7)   hawk       (9,5)(6,2)
!     why        (3,8)(1,8)   ryan       (3,0)(0,0)
!     fay        (9,0)(7,2)   much       (8,8)(8,5)
!     tar        (5,7)(5,5)   elm        (6,0)(8,0)
!     max        (7,4)(9,4)   pup        (5,3)(3,5)
!     mph        (8,8)(6,8)


