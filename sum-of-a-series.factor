! Compute the n^(th) term of a series, i.e. the sum of the n first terms
! of the corresponding sequence.
! 
! Informally this value, or its limit when n tends to infinity, is also
! called the sum of the series, thus the title of this task.
! 
! For this task, use:
! 
!         $S_n = \sum_{k=1}^n \frac{1}{k^2}$
! 
!         and compute S₁₀₀₀
! 
! This approximates the zeta function for S=2, whose exact value
! 
!         $\zeta(2) = {\pi^2\over 6}$
! 
! is the solution of the Basel problem.

1000 [1,b] [ >float sq recip ] map-sum
