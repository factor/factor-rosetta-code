! Task:
! 
! Generate a collection filled with 1000 normally distributed random (or
! pseudo-random) numbers with a mean of 1.0 and a standard deviation of
! 0.5
! 
! Many libraries only generate uniformly distributed random numbers. If
! so, you may use one of these algorithms.
! 
! Related task:
! 
! -   Standard deviation
! 
! Category:Probability and statistics Category:Randomness

USING: random ;
1000 [ 1.0 0.5 normal-random-float ] replicate
