! The Christofides algorithm is an approximation algorithm for solving the
! metric traveling salesman problem (TSP), a classic optimization problem
! in graph theory and computer science. Given a complete undirected graph
! with non-negative edge weights satisfying the triangle inequality, the
! algorithm produces a Hamiltonian circuit (a tour visiting each vertex
! exactly once) with a total weight at most $\frac{3}{2}$ times the weight
! of the optimal tour.
! 
! Problem Description
! 
! The metric TSP is defined as follows: given a set of n vertices and a
! distance function d(u, v) for each pair of vertices u and v, find a
! Hamiltonian circuit with the minimum total distance. The distance
! function must satisfy:
! 
! -   d(u, v) ≥ 0 (non-negativity),
! -   d(u, v) = d(v, u) (symmetry),
! -   d(u, w) ≤ d(u, v) + d(v, w) (triangle inequality).
! 
! The TSP is NP-hard, meaning no known polynomial-time algorithm can solve
! it exactly for all cases unless P = NP. The Christofides algorithm
! provides a polynomial-time approximation with a guaranteed approximation
! ratio of $\frac{3}{2}$ for metric TSP instances.
! 
! Performance Guarantee
! 
! The algorithm guarantees that the weight of the resulting tour is at
! most $\frac{3}{2}$ times the weight of the optimal TSP tour. This bound
! is derived as follows:
! 
! -   The MST weight is at most the weight of the optimal tour (since
!     removing one edge from the optimal tour yields a spanning tree).
! -   The minimum-weight perfect matching for the odd-degree vertices has
!     a weight at most half the optimal tour weight (since the optimal
!     tour induces a matching on these vertices).
! -   The Eulerian circuit’s weight is the sum of the MST and matching
!     weights, and shortcutting does not increase the weight due to the
!     triangle inequality.
! 
! Thus, the total weight is at most
! $\text{MST} + \text{Matching} \leq \text{OPT} + \frac{\text{OPT}}{2} = \frac{3}{2} \text{OPT}$,
! where OPT is the weight of the optimal tour.
! 
! Complexity
! 
! The algorithm runs in polynomial time:
! 
! -   MST computation: O(mlog n) using Kruskal’s or Prim’s algorithm,
!     where m is the number of edges and n is the number of vertices.
! -   Odd-degree vertex identification: O(n).
! -   Minimum-weight perfect matching: O(n³) using algorithms like the
!     blossom algorithm.
! -   Eulerian circuit construction: O(m).
! -   Shortcut to Hamiltonian circuit: O(n).
! 
! The overall time complexity is dominated by the matching step, resulting
! in O(n³) for a complete graph where m = O(n²).
! 
! Limitations
! 
! While the Christofides algorithm provides a $\frac{3}{2}$-approximation
! for metric TSP, it does not apply to non-metric instances (where the
! triangle inequality does not hold). Additionally, the $\frac{3}{2}$
! bound is not always tight; in some cases, the algorithm may produce a
! tour closer to the optimal. However, no polynomial-time algorithm is
! known to achieve a better approximation ratio for metric TSP unless
! P = NP.
! 
! Applications
! 
! The Christofides algorithm is used in logistics, circuit design, and
! network optimization, where finding near-optimal tours is critical. It
! serves as a practical heuristic for problems like vehicle routing and
! scheduling, balancing computational efficiency with solution quality.
! 
! Algorithm Overview
! 
! The Christofides algorithm, proposed by Nicos Christofides in 1976,
! proceeds as follows:
! 
! 1.  Construct a minimum spanning tree (MST) of the graph using an
!     algorithm like Kruskal's algorithm or Prim's algorithm.
! 2.  Identify the vertices with odd degree in the MST. Since a spanning
!     tree has n − 1 edges, the number of odd-degree vertices is even.
! 3.  Compute a minimum-weight perfect matching for these odd-degree
!     vertices, forming a subgraph where each vertex has degree 2.
! 4.  Combine the MST and the matching to form a multigraph that is
!     connected and has even degrees for all vertices.
! 5.  Find an Eulerian circuit in this multigraph (a circuit visiting each
!     edge exactly once).
! 6.  Convert the Eulerian circuit into a Hamiltonian circuit by
!     "shortcutting" repeated vertices, leveraging the triangle inequality
!     to ensure the total weight does not increase.


