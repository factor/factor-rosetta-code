! Introduction
! 
! Romberg integration builds upon the midpoint or trapezium rule, refining
! the results using Richardson extrapolation. Starting with 2 intervals,
! it performs a series of steps each time doubling the number of
! intervals, until the requested precision is reached. The routine is said
! to be faster as Simpson's or Boole's rule.
! ;Pseudo code Below code does not check for the requested precision, but
! just executes the given number of steps, using the trapezium rule. It
! requires the function to integrate, the lower bound, the upper bound and
! the number of steps. Specifying s steps calculates 2**s intervals.
! 
!     procedure Romberg(func,lower,upper,steps)
!     h0 := upper-lower
!     s0 := func(lower)+func(upper)
!     r[0][0] := s0*h0/2
!     n := 1
!     for i := 1 to steps do
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


