! Given:
! 
! -   A starting, positive integer (greater than one), N.
! -   A selection of possible integer perfect divisors, D.
! -   And a selection of possible subtractors, S.
! 
! The goal is find the minimum number of steps necessary to reduce N down
! to one.
! 
! At any step, the number may be:
! 
! -   Divided by any member of D if it is perfectly divided by D,
!     (remainder zero).
! -   OR have one of S subtracted from it, if N is greater than the member
!     of S.
! 
! There may be many ways to reduce the initial N down to 1. Your program
! needs to:
! 
! -   Find the minimum number of steps to reach 1.
! -   Show one way of getting fron N to 1 in those minimum steps.
! 
! Examples:
! 
! No divisors, D. a single subtractor of 1.
! 
!     Obviousely N will take N-1 subtractions of 1 to reach 1
! 
! Single divisor of 2; single subtractor of 1:
! 
!     N = 7 Takes 4 steps N -1=> 6, /2=> 3, -1=> 2, /2=> 1
!     N = 23 Takes 7 steps N -1=>22, /2=>11, -1=>10, /2=> 5, -1=> 4, /2=>
!     2, /2=> 1
! 
! Divisors 2 and 3; subtractor 1:
! 
!     N = 11 Takes 4 steps N -1=>10, -1=> 9, /3=> 3, /3=> 1
! 
! Task:
! 
! Using the possible divisors D, of 2 and 3; together with a possible
! subtractor S, of 1:
! 
!     1. Show the number of steps and possible way of diminishing the
!     numbers 1 to 10 down to 1.
!     2. Show a count of, and the numbers that: have the maximum
!     minimal_steps_to_1, in the range 1 to 2,000.
! 
! Using the possible divisors D, of 2 and 3; together with a possible
! subtractor S, of 2:
! 
!     3. Show the number of steps and possible way of diminishing the
!     numbers 1 to 10 down to 1.
!     4. Show a count of, and the numbers that: have the maximum
!     minimal_steps_to_1, in the range 1 to 2,000.
! 
! Optional stretch goal:
!     2a, and 4a: As in 2 and 4 above, but for N in the range 1 to 20_000
! 
! Reference:
! 
! -   Learn Dynamic Programming (Memoization & Tabulation) Video of
!     similar task.


