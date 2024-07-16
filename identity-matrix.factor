! Task:
! 
! Build an identity matrix of a size known at run-time.
! 
! An identity matrix is a square matrix of size n × n,
! 
! where the diagonal elements are all 1s (ones),
! 
! and all the other elements are all 0s (zeroes).
! 
! $I_n = \begin{bmatrix}
!   1      & 0      & 0      & \cdots & 0      \\
!   0      & 1      & 0      & \cdots & 0      \\
!   0      & 0      & 1      & \cdots & 0      \\
!   \vdots & \vdots & \vdots & \ddots & \vdots \\
!   0      & 0      & 0      & \cdots & 1      \\
! \end{bmatrix}$
! 
! Related tasks:
! 
! -   Spiral matrix
! -   Zig-zag matrix
! -   Ulam_spiral_(for_primes)

USING: math.matrices prettyprint ;

6 <identity-matrix> .
