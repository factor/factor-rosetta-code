! Given an M × N rectangular array of cells numbered
! cell[0..M − 1, 0..N − 1], assume M is horizontal and N is downwards.
! Each cell[m, n] is bounded by (horizontal) walls hwall[m, n] and
! hwall[m + 1, n]; (vertical) walls vwall[m, n] and vwall[m, n + 1]
! 
! Assume that the probability of any wall being present is a constant p
! where
! 
!     0.0 ≤ p ≤ 1.0
! 
! Except for the outer horizontal walls at m = 0 and m = M which are
! always present.
! 
! The task:
! 
! Simulate pouring a fluid onto the top surface (n = 0) where the fluid
! will enter any empty cell it is adjacent to if there is no wall between
! where it currently is and the cell on the other side of the (missing)
! wall.
! 
! The fluid does not move beyond the horizontal constraints of the grid.
! 
! The fluid may move “up” within the confines of the grid of cells. If the
! fluid reaches a bottom cell that has a missing bottom wall then the
! fluid can be said to 'drip' out the bottom at that point.
! 
! Given p repeat the percolation t times to estimate the proportion of
! times that the fluid can percolate to the bottom for any given p.
! 
! Show how the probability of percolating through the random grid changes
! with p going from 0.0 to 1.0 in 0.1 increments and with the number of
! repetitions to estimate the fraction at any given p as t = 100.
! 
! Use an M = 10, N = 10 grid of cells for all cases.
! 
! Optionally depict fluid successfully percolating through a grid
! graphically.
! 
! Show all output on this page.

