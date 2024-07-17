! Szymański's algorithm is a mutual exclusion algorithm devised by
! computer scientist Bolesław Szymański.
! 
! The algorithm allows mutiple processes or tasks to access a serial
! resource without conflict, using only linear waiting times. It has
! application in multitasking and communications, especially if there is a
! need for massive parallelism with limited waiting times for access to
! resources by the parallel program's components.
! 
! Task
! 
! -   Implement Szymanski's algorithm utilizing parallel processes,
!     threads, or similar coroutines.
! -   Your example should implement the steps shown in the Wikipedia's
!     pseudocode at the Wikipedia reference below.
! 
! See also
! * https://en.wikipedia.org/wiki/Szyma%C5%84ski%27s_algorithm Wikipedia entry for Szymański's algorithm
! * https://dl.acm.org/doi/10.1145/55364.55425 ACM digital entry for Szymański's paper
! 
! """ Szymański's algorithm reference: Boleslaw K. Szymanski. A simple
! solution to Lamport's concurrent programming problem with linear wait.
! Proceedings of the 2nd International Conference on Supercomputing, 1988,
! Figure 2, Page 624. https://dl.acm.org/doi/pdf/10.1145/55364.55425
! https://en.wikipedia.org/wiki/Szyma%C5%84ski%27s_algorithm """


