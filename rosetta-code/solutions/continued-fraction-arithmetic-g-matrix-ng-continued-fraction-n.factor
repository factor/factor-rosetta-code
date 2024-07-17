! This task investigates mathmatical operations that can be performed on a
! single continued fraction. This requires only a baby version of NG:
! 
!     $\begin{bmatrix}
!       a_1 & a \\
!       b_1 & b 
!     \end{bmatrix}$
! 
! I may perform perform the following operations:
! 
!     Input the next term of N₁
!     Output a term of the continued fraction resulting from the
!     operation.
! 
! I output a term if the integer parts of $\frac{a}{b}$ and
! $\frac{a_1}{b_1}$ are equal. Otherwise I input a term from N. If I need
! a term from N but N has no more terms I inject ∞.
! 
! When I input a term t my internal state: $\begin{bmatrix}
!   a_1 & a \\
!   b_1 & b 
! \end{bmatrix}$ is transposed thus $\begin{bmatrix} a + a_1 * t & a_1  \\
!   b + b_1 * t & b_1 
! \end{bmatrix}$
! 
! When I output a term t my internal state: $\begin{bmatrix}
!   a_1 & a \\
!   b_1 & b 
! \end{bmatrix}$ is transposed thus $\begin{bmatrix} b_1 & b  \\
!   a_1 - b_1 * t & a - b * t 
! \end{bmatrix}$
! 
! When I need a term t but there are no more my internal state:
! $\begin{bmatrix}
!   a_1 & a \\
!   b_1 & b 
! \end{bmatrix}$ is transposed thus $\begin{bmatrix} a_1 & a_1 \\
!   b_1 & b_1 
! \end{bmatrix}$
! 
! I am done when b₁ and b are zero.
! 
! Demonstrate your solution by calculating:
! 
!     [1;5,2] + 1/2
!     [3;7] + 1/2
!     [3;7] divided by 4
! 
! Using a generator for $\sqrt{2}$ (e.g., from Continued fraction)
! calculate $\frac{1}{\sqrt{2}}$. You are now at the starting line for
! using Continued Fractions to implement Arithmetic-geometric mean without
! ulps and epsilons.
! 
! The first step in implementing Arithmetic-geometric mean is to calculate
! $\frac{1 + \frac{1}{\sqrt{2}}}{2}$ do this now to cross the starting
! line and begin the race.


