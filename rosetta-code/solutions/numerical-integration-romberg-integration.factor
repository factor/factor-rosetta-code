! Introduction
! 
! Romberg integration builds upon the midpoint or trapezium rule, refining
! the results using Richardson extrapolation. Starting with 2 intervals,
! it performs a series of steps each time doubling the number of
! intervals, until the requested precision is reached. The routine is said
! to be faster as Simpson's or Boole's rule.
! ;Pseudo code Below code executes until the specified number of steps or
! the accuracy is reached. It requires the function to integrate, the
! lower bound, the upper bound, the number of steps and the required
! accuracy. Step number i will calculate 2**i intervals.
! 
!     procedure Romberg(func,lower,upper,steps,acc)
!     h0 := upper-lower
!     s0 := func(lower)+func(upper)
!     r[0][0] := s0*h0/2
!     rr := 0
!     n := 1
!     for i := 1 to steps until Abs(rr-ro) < acc do
!        ro := rr
!        n := 2*n
!        h := h0/n
!        s := s0/2
!        for j := 1 to n-1 do
!           s := s+func(lower+j*h)
!        endfor
!        f := 1
!        r[i][0] := s*h
!        for k := 1 to i do
!           r1 := r[i][k-1]
!           r2 := r[i-1][k-1]
!           f := 4*f
!           rr := (f*r1-r2) / (f-1)
!           r[i][k] := rr
!        endfor
!     endfor
!     return rr
! 
! ;Example in single precision
! 
!     print Romberg(sin(x),0,1,5)
! 
! returns 0.45969769.
! ;Task Write a procedure (routine, function, method) that calculates the
! definite integral for a function f(x) using Romberg integration. Test
! your solution by calculating
! ∫⁻³³exp (x) dx ≈ 20.0357499
! with 5 steps.
! ;Reference Wikipedia
! 
! Category:Arithmetic Category:Mathematics


