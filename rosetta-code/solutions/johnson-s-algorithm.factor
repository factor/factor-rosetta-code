! Johnson's Algorithm
! 
! Johnson's algorithm is a procedure for finding the shortest paths
! between all pairs of vertices in a sparse, edge-weighted, directed
! graph. It combines elements of the Bellman-Ford algorithm and Dijkstra's
! algorithm to achieve better performance than the Floyd-Warshall
! algorithm for sparse graphs.
! 
! Problem Description
! 
! ;Input
! 
! -   A directed graph G = (V, E) where V is the set of vertices and E is
!     the set of edges
! -   A weight function w : E → ℝ that assigns a real-valued weight to
!     each edge
! -   The graph may contain negative-weight edges but must not contain any
!     negative-weight cycles
! 
! ;Output
! 
! -   A |V| × |V| matrix D where D[i, j] contains the weight of the
!     shortest path from vertex i to vertex j
! -   If no path exists from i to j, D[i, j] = ∞
! 
! ;Constraints
! 
! -   The graph must not contain any negative-weight cycles
! -   Time complexity: O(V²log V + VE)
! -   Space complexity: O(V²)
! 
! Key Insight
! 
! The key insight of Johnson's algorithm is the use of a reweighting
! technique to transform all edge weights to be non-negative, while
! preserving shortest path relationships. This allows the use of
! Dijkstra's algorithm (which requires non-negative edge weights) for each
! vertex as a source.
! 
! Applications
! 
! Johnson's algorithm is particularly useful in:
! 
! -   Sparse graphs where |E| is much smaller than |V|²
! -   Network routing optimization
! -   Traffic flow analysis
! -   Resource allocation problems
! -   Any context requiring all-pairs shortest paths in a sparse graph
!     with potential negative edges


