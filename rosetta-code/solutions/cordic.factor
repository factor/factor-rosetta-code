! Introduction
! 
! CORDIC is the name of an algorithm for calculating trigonometric,
! logarithmic and hyperbolic functions, named after its first application
! on an airborne computer (COordinate Rotation DIgital Computer) in 1959.
! Unlike a Taylor expansion or polynomial approximation, it converges
! rapidly on machines with low computing and memory capacities: to
! calculate a tangent with 10 significant digits, it requires only 6
! floating-point constants, and only additions, subtractions and digit
! shifts in its iterative part.
! 
! It is valid for angle values between 0 and π/2 only, but whatever the
! value of an angle, the calculation of its tangent can always be reduced
! to that of an angle between 0 and π/2, using trigonometric identities.
! Similarly, once you know the tangent, you can easily calculate the sine
! or cosine.
! 
! Pseudo code
! 
! constant θ[n] = arctan 10^(-n) // or simply 10^(-n) depending on floating point precision 
! constant epsilon = 10^-12
! 
! function tan(alpha)            // 0 < alpha <= π/2 
!   x = 1 ; y = 0 ; k = 0
!   while epsilon < alpha
!     while alpha < θ[k] 
!        k++
!     end loop
!     alpha -= θ[k]
!     x2 = x - 10^(-k)*y
!     y2 = y + 10^(-k)*x
!     x = x2 ; y = y2
!   end loop
!   return (y/x)
! end function
! 
! Task
! 
! -   Implement the CORDIC algorithm, using only the 4 arithmetic
!     operations and right shifts in the main loop if possible.
! -   Use your implementation to calculate the cosine of the following
!     angles, expressed in radians: -9, 0, 1.5 and 6
! 
! See also
! 
! CORDIC on Wikipedia


