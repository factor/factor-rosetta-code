! The Floyd–Warshall algorithm is an algorithm for finding shortest paths
! in a weighted graph with positive or negative edge weights.
! 
! Task
! 
! Find the lengths of the shortest paths between all pairs of vertices of
! the given directed graph. Your code may assume that the input has
! already been checked for loops, parallel edges and negative cycles.
! 
! [||center]
! 
! Print the pair, the distance and (optionally) the path.
! 
! Example
! 
!     pair     dist    path
!     1 -> 2    -1     1 -> 3 -> 4 -> 2
!     1 -> 3    -2     1 -> 3
!     1 -> 4     0     1 -> 3 -> 4
!     2 -> 1     4     2 -> 1
!     2 -> 3     2     2 -> 1 -> 3
!     2 -> 4     4     2 -> 1 -> 3 -> 4
!     3 -> 1     5     3 -> 4 -> 2 -> 1
!     3 -> 2     1     3 -> 4 -> 2
!     3 -> 4     2     3 -> 4
!     4 -> 1     3     4 -> 2 -> 1
!     4 -> 2    -1     4 -> 2
!     4 -> 3     1     4 -> 2 -> 1 -> 3
! 
! See also
! 
! -   Floyd-Warshall Algorithm - step by step guide (youtube)


