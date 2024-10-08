! Kosaraju's algorithm (also known as the Kosaraju–Sharir algorithm) is a
! linear time algorithm to find the strongly connected components of a
! directed graph. Aho, Hopcroft and Ullman credit it to an unpublished
! paper from 1978 by S. Rao Kosaraju. The same algorithm was independently
! discovered by Micha Sharir and published by him in 1981. It makes use of
! the fact that the transpose graph (the same graph with the direction of
! every edge reversed) has exactly the same strongly connected components
! as the original graph.
! 
! For this task consider the directed graph with these connections:
! 
!  0 -> 1
!  1 -> 2
!  2 -> 0
!  3 -> 1,  3 -> 2,  3 -> 4
!  4 -> 3,  4 -> 5
!  5 -> 2,  5 -> 6
!  6 -> 5
!  7 -> 4, 7  -> 6, 7 -> 7
! 
! And report the kosaraju strongly connected component for each node.
! 
! References:
! 
! -   The article on Wikipedia.
! 
! Category:Algorithm


