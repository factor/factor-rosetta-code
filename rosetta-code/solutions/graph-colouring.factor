! A Graph is a collection of nodes (or vertices), connected by edges (or
! not). Nodes directly connected by edges are called neighbours.
! 
! In our representation of graphs, nodes are numbered and edges are
! represented by the two node numbers connected by the edge separated by a
! dash. Edges define the nodes being connected. Only unconnected nodes
! need a separate description.
! 
! For example,
! 
!     0-1 1-2 2-0 3
! 
! Describes the following graph. Note that node 3 has no neighbours
! 
! Example graph:
! 
!     +---+
!     | 3 |
!     +---+
! 
!       +-------------------+
!       |                   |
!     +---+     +---+     +---+
!     | 0 | --- | 1 | --- | 2 |
!     +---+     +---+     +---+
! 
! A useful internal datastructure for a graph and for later graph
! algorithms is as a mapping between each node and the set/list of its
! neighbours.
! 
! In the above example:
! 
!     0 maps-to 1 and 2
!     1 maps to 2 and 0
!     2 maps-to 1 and 0
!     3 maps-to <nothing>
! 
! Graph colouring task:
! 
! Colour the vertices of a given graph so that no edge is between
! verticies of the same colour.
! 
! -   Integers may be used to denote different colours.
! -   Algorithm should do better than just assigning each vertex a
!     separate colour. The idea is to minimise the number of colours used,
!     although no algorithm short of exhaustive search for the minimum is
!     known at present, (and exhaustive search is not a requirement).
! -   Show for each edge, the colours assigned on each vertex.
! -   Show the total number of nodes, edges, and colours used for each
!     graph.
! 
! Use the following graphs:
! Ex1:
! 
!        0-1 1-2 2-0 3
! 
!     +---+
!     | 3 |
!     +---+
! 
!       +-------------------+
!       |                   |
!     +---+     +---+     +---+
!     | 0 | --- | 1 | --- | 2 |
!     +---+     +---+     +---+
! 
! Ex2:
! 
! The wp articles left-side graph
! 
!    1-6 1-7 1-8 2-5 2-7 2-8 3-5 3-6 3-8 4-5 4-6 4-7
! 
! 
!       +----------------------------------+
!       |                                  |
!       |                      +---+       |
!       |    +-----------------| 3 | ------+----+
!       |    |                 +---+       |    |
!       |    |                   |         |    |
!       |    |                   |         |    |
!       |    |                   |         |    |
!       |  +---+     +---+     +---+     +---+  |
!       |  | 8 | --- | 1 | --- | 6 | --- | 4 |  |
!       |  +---+     +---+     +---+     +---+  |
!       |    |         |                   |    |
!       |    |         |                   |    |
!       |    |         |                   |    |
!       |    |       +---+     +---+     +---+  |
!       +----+------ | 7 | --- | 2 | --- | 5 | -+
!            |       +---+     +---+     +---+
!            |                   |
!            +-------------------+
! 
! Ex3:
! 
! The wp articles right-side graph which is the same graph as Ex2, but
! with different node orderings and namings.
! 
!    1-4 1-6 1-8 3-2 3-6 3-8 5-2 5-4 5-8 7-2 7-4 7-6
! 
! 
!       +----------------------------------+
!       |                                  |
!       |                      +---+       |
!       |    +-----------------| 5 | ------+----+
!       |    |                 +---+       |    |
!       |    |                   |         |    |
!       |    |                   |         |    |
!       |    |                   |         |    |
!       |  +---+     +---+     +---+     +---+  |
!       |  | 8 | --- | 1 | --- | 4 | --- | 7 |  |
!       |  +---+     +---+     +---+     +---+  |
!       |    |         |                   |    |
!       |    |         |                   |    |
!       |    |         |                   |    |
!       |    |       +---+     +---+     +---+  |
!       +----+------ | 6 | --- | 3 | --- | 2 | -+
!            |       +---+     +---+     +---+
!            |                   |
!            +-------------------+
! 
! Ex4:
! 
! This is the same graph, node naming, and edge order as Ex2 except some
! of the edges x-y are flipped to y-x. This might alter the node order
! used in the greedy algorithm leading to differing numbers of colours.
! 
!    1-6 7-1 8-1 5-2 2-7 2-8 3-5 6-3 3-8 4-5 4-6 4-7
! 
! 
!                           +-------------------------------------------------+
!                           |                                                 |
!                           |                                                 |
!       +-------------------+---------+                                       |
!       |                   |         |                                       |
!     +---+     +---+     +---+     +---+     +---+     +---+     +---+     +---+
!     | 4 | --- | 5 | --- | 2 | --- | 7 | --- | 1 | --- | 6 | --- | 3 | --- | 8 |
!     +---+     +---+     +---+     +---+     +---+     +---+     +---+     +---+
!       |         |                             |         |         |         |
!       +---------+-----------------------------+---------+         |         |
!                 |                             |                   |         |
!                 |                             |                   |         |
!                 +-----------------------------+-------------------+         |
!                                               |                             |
!                                               |                             |
!                                               +-----------------------------+
! 
! References:
! 
! -   Greedy coloring Wikipedia.
! -   Graph Coloring : Greedy Algorithm & Welsh Powell Algorithm by
!     Priyank Jain.


