! The A* search algorithm is an extension of Dijkstra's algorithm useful
! for finding the lowest cost path between two nodes (aka vertices) of a
! graph. The path may traverse any number of nodes connected by edges (aka
! arcs) with each edge having an associated cost. The algorithm uses a
! heuristic which associates an estimate of the lowest cost path from this
! node to the goal node, such that this estimate is never greater than the
! actual cost.
! 
! The algorithm should not assume that all edge costs are the same. It
! should be possible to start and finish on any node, including ones
! identified as a barrier in the task.
! 
! Task
! 
! Consider the problem of finding a route across the diagonal of a chess
! board-like 8x8 grid. The rows are numbered from 0 to 7. The columns are
! also numbered 0 to 7. The start position is (0, 0) and the end position
! is (7, 7). Movement is allow by one square in any direction including
! diagonals, similar to a king in chess. The standard movement cost is 1.
! To make things slightly harder, there is a barrier that occupy certain
! positions of the grid. Moving into any of the barrier positions has a
! cost of 100.
! 
! The barrier occupies the positions (2,4), (2,5), (2,6), (3,6), (4,6),
! (5,6), (5,5), (5,4), (5,3), (5,2), (4,2) and (3,2).
! 
! A route with the lowest cost should be found using the A* search
! algorithm (there are multiple optimal solutions with the same total
! cost).
! 
! Print the optimal route in text format, as well as the total cost of the
! route.
! 
! Optionally, draw the optimal route and the barrier positions.
! 
! Note: using a heuristic score of zero is equivalent to Dijkstra's
! algorithm and that's kind of cheating/not really A*!
! 
! Extra Credit
! 
! Use this algorithm to solve an 8 puzzle. Each node of the input graph
! will represent an arrangement of the tiles. The nodes will be connected
! by 4 edges representing swapping the blank tile up, down, left, or
! right. The cost of each edge is 1. The heuristic will be the sum of the
! manhatten distance of each numbered tile from its goal position. An 8
! puzzle graph will have 9!/2 (181,440) nodes. The 15 puzzle has over 10
! trillion nodes. This algorithm may solve simple 15 puzzles (but there
! are not many of those).
! 
! See also:
! 
! -   Wikipedia webpage: A* search algorithm.
! -   An introduction to: Breadth First Search |> Dijkstra’s Algorithm |>
!     A*
! 
! Related tasks:
! 
! -   15 puzzle solver
! -   Dijkstra's algorithm
! -   Knapsack problem/0-1


