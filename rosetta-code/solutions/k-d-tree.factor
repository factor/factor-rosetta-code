! A k-d tree (short for k-dimensional tree) is a space-partitioning data
! structure for organizing points in a k-dimensional space. k-d trees are
! a useful data structure for several applications, such as searches
! involving a multidimensional search key (e.g. range searches and nearest
! neighbor searches). k-d trees are a special case of binary space
! partitioning trees.
! 
! k-d trees are not suitable, however, for efficiently finding the nearest
! neighbor in high dimensional spaces. As a general rule, if the
! dimensionality is k, the number of points in the data, N, should be
! N ≫ 2^(k). Otherwise, when k-d trees are used with high-dimensional
! data, most of the points in the tree will be evaluated and the
! efficiency is no better than exhaustive search, and other methods such
! as approximate nearest-neighbor are used instead.
! 
! Task: Construct a k-d tree and perform a nearest neighbor search for two
! example data sets:
! 
! 1.  The Wikipedia example data of [(2,3), (5,4), (9,6), (4,7), (8,1),
!     (7,2)].
! 2.  1000 3-d points uniformly distributed in a 3-d cube.
! 
! For the Wikipedia example, find the nearest neighbor to point (9, 2) For
! the random data, pick a random location and find the nearest neighbor.
! 
! In addition, instrument your code to count the number of nodes visited
! in the nearest neighbor search. Count a node as visited if any field of
! it is accessed.
! 
! Output should show the point searched for, the point found, the distance
! to the point, and the number of nodes visited.
! 
! There are variant algorithms for constructing the tree. You can use a
! simple median strategy or implement something more efficient. Variants
! of the nearest neighbor search include nearest N neighbors, approximate
! nearest neighbor, and range searches. You do not have to implement
! these. The requirement for this task is specifically the nearest single
! neighbor. Also there are algorithms for inserting, deleting, and
! balancing k-d trees. These are also not required for the task.
! 
! Category:Data Structures


