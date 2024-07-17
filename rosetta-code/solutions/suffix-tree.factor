! A suffix tree is a data structure commonly used in string algorithms.
! 
! Given a string S of length n, its suffix tree is a tree T such that:
! 
! -   T has exactly n leaves numbered from 1 to n.
! -   Except for the root, every internal node has at least two children.
! -   Each edge of T is labelled with a non-empty substring of S.
! -   No two edges starting out of a node can have string labels beginning
!     with the same character.
! -   The string obtained by concatenating all the string labels found on
!     the path from the root to leaf i spells out suffix S[i..n], for i
!     from 1 to n.
! 
! Such a tree does not exist for all strings. To ensure existence, a
! character that is not found in S must be appended at its end. The
! character '$' is traditionally used for this purpose.
! 
! For this task, build and display the suffix tree of the string
! "banana$". Displaying the tree can be done using the code from the
! visualize a tree task, but any other convenient method is accepted.
! 
! There are several ways to implement the tree data structure, for
! instance how edges should be labelled. Latitude is given in this matter,
! but notice that a simple way to do it is to label each node with the
! label of the edge leading to it.
! 
! The computation time for an efficient algorithm should be O(n), but such
! an algorithm might be difficult to implement. An easier, O(n²) algorithm
! is accepted.
! 
! Category:String algorithms


