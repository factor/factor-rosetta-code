! Thiele's interpolation formula is an interpolation formula for a
! function f(•) of a single variable. It is expressed as a continued
! fraction:
! 
!         $f(x) = f(x_1) + \cfrac{x-x_1}{\rho_1(x_1,x_2) + \cfrac{x-x_2}{\rho_2(x_1,x_2,x_3) - f(x_1) + \cfrac{x-x_3}{\rho_3(x_1,x_2,x_3,x_4) - \rho_1(x_1,x_2) + \cdots}}}$
! 
! ρ represents the reciprocal difference, demonstrated here for reference:
! 
!         $\rho_1(x_0, x_1) = \frac{x_0 - x_1}{f(x_0) - f(x_1)}$
! 
!         $\rho_2(x_0, x_1, x_2) = \frac{x_0 - x_2}{\rho_1(x_0, x_1) - \rho_1(x_1, x_2)} + f(x_1)$
! 
!         $\rho_n(x_0,x_1,\ldots,x_n)=\frac{x_0-x_n}{\rho_{n-1}(x_0,x_1,\ldots,x_{n-1})-\rho_{n-1}(x_1,x_2,\ldots,x_n)}+\rho_{n-2}(x_1,\ldots,x_{n-1})$
! 
! Demonstrate Thiele's interpolation function by:
! 
! 1.  Building a 32 row trig table of values for x from 0 by 0.05 to 1.55
!     of the trig functions:
!     -   sin
!     -   cos
!     -   tan
! 2.  Using columns from this table define an inverse - using Thiele's
!     interpolation - for each trig function;
! 3.  Finally: demonstrate the following well known trigonometric
!     identities:
!     -    6 × sin⁻¹ ½ = π
!     -    3 × cos⁻¹ ½ = π
!     -    4 × tan⁻¹ 1 = π

