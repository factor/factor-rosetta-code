! Quoted from the Wikipedia page : Simulated annealing (SA) is a
! probabilistic technique for approximating the global optimum of a given
! function. Simulated annealing interprets slow cooling as a slow decrease
! in the probability of temporarily accepting worse solutions as it
! explores the solution space.
! 
! Pseudo code from Wikipedia
! 
!     Notations :
!       T : temperature. Decreases to 0.
!       s : a system state
!       E(s) : Energy at s. The function we want to minimize
!       ∆E : variation of E, from state s to state s_next
!       P(∆E , T) : Probability to move from s to s_next. 
!         if  ( ∆E < 0 ) P = 1
!               else P = exp ( - ∆E / T) . Decreases as T →  0
! 
!     Pseudo-code:
!         Let s = s0  -- initial state
!         For k = 0 through kmax (exclusive):
!             T ← temperature(k , kmax)
!             Pick a random neighbour state , s_next ← neighbour(s)
!             ∆E ← E(s) - E(s_next) 
!             If P(∆E , T) ≥ random(0, 1), move to the new state:
!                 s ← s_next
!         Output: the final state s
! 
! Problem statement
! 
! We want to apply SA to the travelling salesman problem. There are 100
! cities, numbered 0 to 99, located on a plane, at integer coordinates i,j
! : 0 <= i,j < 10 . The city at (i,j) has number 10*i + j. The cities are
! all connected : the graph is complete : you can go from one city to any
! other city in one step.
! 
! The salesman wants to start from city 0, visit all cities, each one
! time, and go back to city 0. The travel cost between two cities is the
! euclidian distance between them. The total travel cost is the total path
! length.
! 
! A path s is a sequence (0 a b ...z 0) where (a b ..z) is a permutation
! of the numbers (1 2 .. 99). The path length = E(s) is the sum d(0,a) +
! d(a,b) + ... + d(z,0) , where d(u,v) is the distance between two cities.
! Naturally, we want to minimize E(s).
! 
! Definition : The neighbours of a city are the closest cities at distance
! 1 horizontally/vertically, or √2 diagonally. A corner city (0,9,90,99)
! has 3 neighbours. A center city has 8 neighbours.
! 
!     Distances between cities
!     d ( 0, 7) → 7
!     d ( 0, 99) → 12.7279
!     d ( 23, 78) → 7.0711
!     d ( 33, 44) → 1.4142 // sqrt(2)
! 
! Task
! 
! Apply SA to the travelling salesman problem, using the following set of
! parameters/functions :
! 
! -   kT = 1 (Multiplication by kT is a placeholder, representing
!     computing temperature as a function of 1-k/kmax):
! -   temperature (k, kmax) = kT * (1 - k/kmax)
! -   neighbour (s) : Pick a random city u > 0 . Pick a random neighbour
!     city v > 0 of u , among u's 8 (max) neighbours on the grid. Swap u
!     and v in s . This gives the new state s_next.
! -   kmax = 1000_000
! -   s0 = a random permutation
! 
! For k = 0 to kmax by step kmax/10 , display k, T, E(s). Display the
! final state s_final, and E(s_final).
! 
! You will see that the Energy may grow to a local optimum, before
! decreasing to a global optimum.
! 
! Illustrated example
! 
!    Temperature charts
! 
! Numerical example
! 
!     kT = 1
!     E(s0) = 529.9158
! 
!     k:  0         T:  1       Es:  529.9158
!     k:  100000    T:  0.9     Es:  201.1726
!     k:  200000    T:  0.8     Es:  178.1723
!     k:  300000    T:  0.7     Es:  154.7069
!     k:  400000    T:  0.6     Es:  158.1412 <== local optimum
!     k:  500000    T:  0.5     Es:  133.856
!     k:  600000    T:  0.4     Es:  129.5684
!     k:  700000    T:  0.3     Es:  112.6919
!     k:  800000    T:  0.2     Es:  105.799
!     k:  900000    T:  0.1     Es:  102.8284
!     k:  1000000   T:  0       Es:  102.2426
! 
!     E(s_final) =    102.2426    
!     Path  s_final =   ( 0 10 11 21 31 20 30 40 50 60 70 80 90 91 81 71 73 83 84 74 64 54 55 65 75 76 66
!      67 77 78 68 58 48 47 57 56 46 36 37 27 26 16 15 5 6 7 17 18 8 9 19 29 28 38 39 49 59 69 
!     79 89 99 98 88 87 97 96 86 85 95 94 93 92 82 72 62 61 51 41 42 52 63 53 43 32 22 12 13 
!     23 33 34 44 45 35 25 24 14 4 3 2 1 0)  
! 
! Extra credit
! 
! Tune the parameters kT, kmax, or use different temperature() and/or
! neighbour() functions to demonstrate a quicker convergence, or a better
! optimum.


