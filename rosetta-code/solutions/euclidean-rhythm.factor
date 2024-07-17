! The Euclidean rhythm was proposed by Godfried Toussaint in 2004 and is
! described in a 2005 paper "The Euclidean Algorithm Generates Traditional
! Musical Rhythms".[1] It generates many forms of rhythm in music around
! the world. The program takes 2 integers (m, n) and outputs a binary
! string with m ones and (n-m) zeros.
! 
! As an example, here is how it runs on (5, 13):
! 
! -   Write 5 ones followed by (13-5) zeros, into 13 groups of 1-digit
!     each:
!     -   1 1 1 1 1 | 0 0 0 0 0 0 0 0
! -   Repeatedly append substitute the second group into the first group:
!     -   1 1 1 1 1 | 0 0 0 0 0 0 0 0
!     -   10 10 10 10 10 | 0 0 0
!     -   100 100 100 10 10 |
! -   If the first group consists of elements of the same form, then
!     output. Otherwise, divide the first group into two groups of the two
!     forms, and repeat the process:
!     -   100 100 100 10 10 |
!     -   100 100 100 | 10 10
!     -   10010 10010 100 |
! -   At this point, we can continue the algorithm until only one form
!     remains, but notice that one of the groups has only one element
!     [100], so the algorithm can actually terminate right here and output
!     the concatenation 1001010010100.
! 
! [1] The Euclidean algorithm generates traditional musical rhythms by G.
! T. Toussaint, Proceedings of BRIDGES: Mathematical Connections in Art,
! Music, and Science, Banff, Alberta, Canada, July 31 to August 3, 2005,
! pp. 47–56.


