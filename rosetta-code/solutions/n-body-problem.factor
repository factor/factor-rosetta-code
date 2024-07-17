! The N-body problem is an inherent feature of a physical description of
! mechanical system of N interacting objects. The system is described by
! Newton's Law
! 
!     $\vec F = m_i \frac{d^2 \vec r_{i}}{dt^2}, i=1..N$
! 
! with continuous combined force from other bodies
! 
!     $F_i = \sum^{}_{j\neq i} F_{ij}, i=1..N$
! 
! Exact formulation of first mechanical problem is, given initial
! coordinates and velocities t = 0, to find coordinates and velocities at
! t = t₀ with accuracy more then given relative value
! $\epsilon = \frac{\vec r- \vec r'}{|\vec r|}$
! 
! As well known from physical background, only the choice of N = 2 can be
! analytically solved.
! 
! Task
! 
! Write a simulation of three masses interacting under gravitation and
! show their evolution over a number of time-steps (at least 20).


