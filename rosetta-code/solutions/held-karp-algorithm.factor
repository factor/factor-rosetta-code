! Held–Karp Algorithm Problem Description
! 
! The Held–Karp algorithm is a classic dynamic programming algorithm used
! to solve the Traveling Salesperson Problem (TSP). While the TSP is an
! NP-hard problem, the Held–Karp algorithm provides an exact solution in
! exponential time, which is considerably more efficient than a
! brute-force search for small to moderately sized inputs.
! 
! Problem Statement: Traveling Salesperson Problem
! 
! Given a set of n cities and a matrix C where C_(ij) represents the cost
! (or distance) of traveling from city i to city j, the Traveling
! Salesperson Problem (TSP) requires finding the minimum-cost route that
! visits each city exactly once and returns to the starting city.
! 
! Let the cities be indexed from 0 to n − 1. We seek a permutation of
! cities (v₀, v₁, …, v_(n − 1)), where v₀ is the starting city (e.g., city
! 0), such that the total cost of the cycle
! 
! $\text{Total Cost} = \sum_{i=0}^{n-2} C_{v_i, v_{i+1}} + C_{v_{n-1}, v_0}$
! 
! is minimized.
! 
! Algorithm Overview
! 
! The Held–Karp algorithm employs dynamic programming to solve the TSP. It
! breaks down the problem into smaller subproblems defined by the set of
! cities visited so far and the current location of the salesperson.
! 
! Dynamic Programming State
! 
! Let dp(S, j) represent the minimum cost of a path that starts at a
! designated city (typically city 0), visits all cities in the set S
! exactly once, and ends at city j, where j ∈ S and the starting city
! 0 ∈ S.
! 
! Here, S is a subset of the set of all cities V = 0, 1, …, n − 1, and j
! is a city in the subset S. Note that we fix the starting city as 0 and
! require 0 ∈ S for any state.
! 
! Base Case
! 
! The base case for the dynamic programming is a path starting at city 0
! and going directly to another city j. For all cities j ∈ 1, 2, …, n − 1:
! 
! dp({0, j}, j) = C_(0, j)
! 
! This represents the shortest path from city 0 visiting only cities 0 and
! j, ending at city j.
! 
! Recurrence Relation
! 
! To compute dp(S, j) for a subset S with |S| > 2 and j ≠ 0, the path must
! have arrived at city j from some city i where i ∈ S and i ≠ j. The path
! leading to city i must have visited all cities in the subset S \ j and
! ended at i. The cost of this path is dp(S \ j, i). Therefore, the
! minimum cost to reach city j having visited all cities in S is the
! minimum cost over all possible preceding cities i plus the cost of the
! final leg from i to j.
! 
! For S ⊆ V with |S| > 2, 0 ∈ S, and j ∈ S, j ≠ 0:
! 
! dp(S, j) = min_(i ∈ S, i ≠ j){dp(S \ {j}, i) + C_(i, j)}
! 
! The algorithm computes these values iteratively, starting with subsets
! of size 2, then size 3, and so on, up to size n.
! 
! Final Solution
! 
! The final goal is to find the shortest Hamiltonian cycle starting and
! ending at city 0. This means we need to find the shortest path that
! visits all cities in V, ends at some city j ≠ 0, and then add the cost
! of returning from j to 0.
! 
! The minimum total cost for the TSP is:
! 
! min_(j ∈ {1, …, n − 1}){dp(V, j) + C_(j, 0)}
! 
! where V is the set of all n cities.
! 
! Complexity
! 
! The time complexity of the Held–Karp algorithm is determined by the
! number of states and the cost to compute each state.
! 
! Number of states (S, j): There are 2^(n − 1) possible subsets S that
! contain city 0. For each subset S with k cities, there are k − 1
! possible ending cities j ≠ 0. The total number of states is bounded by
! O(n2^(n)).
! 
! Transition cost: To compute dp(S, j), we iterate through all possible
! previous cities i ∈ S \ j. There are at most n − 1 such cities.
! 
! Overall time complexity: O(n ⋅ 2^(n) ⋅ n) = O(n²2^(n)).
! 
! The space complexity required to store the DP table dp(S, j) is
! proportional to the number of states, which is O(n2^(n)).
! 
! While exponential, this is significantly better than the O(n!)
! complexity of brute-force enumeration of all possible permutations.


