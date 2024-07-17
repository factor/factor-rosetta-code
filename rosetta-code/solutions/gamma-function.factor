! Task:
! 
! Implement one algorithm (or more) to compute the Gamma (Γ) function (in
! the real field only).
! 
! If your language has the function as built-in or you know a library
! which has it, compare your implementation's results with the results of
! the built-in/library function.
! 
! The Gamma function can be defined as:
! 
!     
! 
!          Γ(x) = ∫₀^(∞)t^(x − 1)e^(−t)dt
! 
! This suggests a straightforward (but inefficient) way of computing the Γ
! through numerical integration.
! 
! Better suggested methods:
! 
! -   Lanczos approximation
! -   Stirling's approximation

! built in
USING: picomath prettyprint ;
0.1 gamma .  ! 9.513507698668723
2.0 gamma .  ! 1.0
10. gamma .  ! 362880.0
