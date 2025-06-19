! The Hopcroft-Karp Algorithm addresses the problem of finding a maximum
! cardinality matching in a bipartite graph. A bipartite graph is a graph
! whose vertices can be divided into two disjoint sets, say U and V, such
! that every edge connects a vertex in U to a vertex in V. A matching in
! this context is a set of edges where no two edges share a common vertex.
! The goal is to maximize the number of edges in the matching, ensuring
! the largest possible number of vertices in U and V are paired.
! 
! The problem can be formally stated as follows: Given a bipartite graph
! G = (U ∪ V, E), where U and V are the two sets of vertices and E is the
! set of edges, find a matching M ⊆ E such that the size of M (denoted
! |M|), the number of edges in the matching, is maximized. This is known
! as the maximum bipartite matching problem.
! 
! Mathematically, the objective is to maximize: |M| subject to the
! constraint that for any two edges e₁ = (u₁, v₁) and e₂ = (u₂, v₂) in M,
! u₁ ≠ u₂ and v₁ ≠ v₂, ensuring no vertex is incident to more than one
! edge in the matching.
! 
! The pseudocode for the Hopcroft-Karp Algorithm looks like:
! 
!     ALGORITHM Hopcroft-Karp(G, U, V)
!         // G is the bipartite graph with partitions U and V
!         // U is the left partition, V is the right partition
!         // NIL represents an unmatched vertex (0)
!         // INF represents infinity
! 
!         // Initialize matching arrays
!         pair_u ← array of size |U| + 1 initialized with NIL
!         pair_v ← array of size |V| + 1 initialized with NIL
!         dist ← array of size |U| + 1 for distances
!         matching_size ← 0
! 
!         WHILE BFS(G, pair_u, pair_v, dist) DO
!             FOR each u ∈ U DO
!                 IF pair_u[u] = NIL THEN
!                     IF DFS(G, u, pair_u, pair_v, dist) THEN
!                         matching_size ← matching_size + 1
!         RETURN matching_size
! 
!     FUNCTION BFS(G, pair_u, pair_v, dist)
!         queue ← empty queue
! 
!         // Initialize distances
!         FOR u ← 1 to |U| DO
!             IF pair_u[u] = NIL THEN
!                 dist[u] ← 0
!                 enqueue(queue, u)
!             ELSE
!                 dist[u] ← INF
!         dist[NIL] ← INF
! 
!         WHILE queue not empty DO
!             u ← dequeue(queue)
!             IF dist[u] < dist[NIL] THEN
!                 FOR each v in G.adj[u] DO
!                     matched_u ← pair_v[v]
!                     IF dist[matched_u] = INF THEN
!                         dist[matched_u] ← dist[u] + 1
!                         enqueue(queue, matched_u)
! 
!         RETURN dist[NIL] ≠ INF
! 
!     FUNCTION DFS(G, u, pair_u, pair_v, dist)
!         IF u ≠ NIL THEN
!             FOR each v in G.adj[u] DO
!                 matched_u ← pair_v[v]
!                 IF dist[matched_u] = dist[u] + 1 THEN
!                     IF DFS(G, matched_u, pair_u, pair_v, dist) THEN
!                         pair_v[v] ← u
!                         pair_u[u] ← v
!                         RETURN TRUE
!             dist[u] ← INF
!             RETURN FALSE
!         RETURN TRUE
! 
!     // Graph Representation
!     // G.adj[u] contains the list of neighbors of vertex u in V
!     // pair_u[u] stores the vertex v matched with u (or NIL)
!     // pair_v[v] stores the vertex u matched with v (or NIL)
!     // dist[u] stores the distance of vertex u during BFS


