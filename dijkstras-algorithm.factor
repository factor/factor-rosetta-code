! Dijkstra's algorithm, conceived by Dutch computer scientist Edsger
! Dijkstra in 1956 and published in 1959, is a graph search algorithm that
! solves the single-source shortest path problem for a graph with
! non-negative edge path costs, producing a shortest path tree.
! 
! This algorithm is often used in routing and as a subroutine in other
! graph algorithms.
! 
! For a given source vertex (node) in the graph, the algorithm finds the
! path with lowest cost (i.e. the shortest path) between that vertex and
! every other vertex.
! 
! For instance:
! 
! If the vertices of the graph represent cities and edge path costs
! represent driving distances between pairs of cities connected by a
! direct road, Dijkstra's algorithm can be used to find the shortest route
! between one city and all other cities.
! 
! As a result, the shortest path first is widely used in network routing
! protocols, most notably:
! 
! -   -   IS-IS (Intermediate System to Intermediate System) and
!     -   OSPF (Open Shortest Path First).
! 
! Important note:
! 
! The inputs to Dijkstra's algorithm are a directed and weighted graph
! consisting of 2 or more nodes, generally represented by:
! 
! -   -   an adjacency matrix or list, and
!     -   a start node.
! 
! A destination node is not specified.
! 
! The output is a set of edges depicting the shortest path to each
! destination node.
! 
! An example, starting with:
! 
!                                              a──►b,  cost=7,   lastNode=a  
!                                              a──►c,  cost=9,   lastNode=a 
!                                              a──►d,  cost=NA,  lastNode=a
!                                              a──►e,  cost=NA,  lastNode=a 
!                                              a──►f,  cost=14,  lastNode=a
! 
!         The lowest cost is    a──►b    so    a──►b    is added to the output. 
! 
!         There is a connection from   b──►d   so the input is updated to: 
!                                              a──►c,  cost=9,   lastNode=a 
!                                              a──►d,  cost=22,  lastNode=b 
!                                              a──►e,  cost=NA,  lastNode=a 
!                                              a──►f,  cost=14,  lastNode=a
! 
!         The lowest cost is    a──►c    so    a──►c    is added to the output. 
! 
!         Paths to    d    and    f    are cheaper via    c    so the input is updated to:
!                                              a──►d,  cost=20,  lastNode=c 
!                                              a──►e,  cost=NA,  lastNode=a 
!                                              a──►f,  cost=11,  lastNode=c
! 
!         The lowest cost is    a──►f    so    c──►f    is added to the output. 
! 
!         The input is updated to:
!                                              a──►d,  cost=20,  lastNode=c 
!                                              a──►e,  cost=NA,  lastNode=a
! 
!         The lowest cost is    a──►d    so    c──►d    is added to the output. 
! 
!         There is a connection from    d──►e    so the input is updated to:
!                                              a──►e,  cost=26,  lastNode=d
! 
!         Which just leaves adding    d──►e    to the output.
! 
!         The output should now be:
!                                            [ d──►e
!                                              c──►d
!                                              c──►f
!                                              a──►c
!                                              a──►b ]   
! 
! Task:
! 
! 1.  Implement a version of Dijkstra's algorithm that outputs a set of
!     edges depicting the shortest path to each reachable node from an
!     origin.
! 2.  Run your program with the following directed graph starting at node
!     a.
! 3.  Write a program which interprets the output from the above and use
!     it to output the shortest path from node a to nodes e and f.
! 
!         {| class="wikitable" style="text-align: center; float: left"
! 
! |+ Vertices |- ! Number !! Name |- | 1 || a |- | 

