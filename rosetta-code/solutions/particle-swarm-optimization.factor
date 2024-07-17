!  Particle Swarm Optimization (PSO) is an optimization method in which multiple candidate solutions ('particles') migrate through the solution space under the influence of local and global best known positions. PSO does not require that the objective function be differentiable and can optimize over very large problem spaces, but is not guaranteed to converge. The method should be demonstrated by application of the functions recommended below, and possibly other standard or well-known optimization test cases.
! 
! The goal of parameter selection is to ensure that the global minimum is
! discriminated from any local minima, and that the minimum is accurately
! determined, and that convergence is achieved with acceptable resource
! usage. To provide a common basis for comparing implementations, the
! following test cases are recommended:
! 
! -   McCormick function - bowl-shaped, with a single minimum
! 
!     function parameters and bounds (recommended):
! -   -1.5 < x1 < 4
! -   -3 < x2 < 4
! 
! search parameters (suggested):
! 
! omega = 0
! 
! phi p = 0.6
! 
! phi g = 0.3
! 
! number of particles = 100
! 
! number of iterations = 40
! 
! Michalewicz function - steep ridges and valleys, with multiple minima
! 
! function parameters and bounds (recommended):
! 
! 0 < x1 < pi
! 
! 0 < x2 < pi
! 
! search parameters (suggested):
! 
! omega = 0.3
! 
! phi p = 0.3
! 
! phi g = 0.3
! 
! number of particles = 1000
! 
! number of iterations = 30
! 
!  References:
!  
! 
! -   [Particle Swarm Optimization1]
! -   [Virtual Library of Optimization Test Functions2]


