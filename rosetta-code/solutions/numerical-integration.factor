! Write functions to calculate the definite integral of a function using
! all five of the following methods:
! 
! -   -   rectangular
!         -   left
!         -   right
!         -   midpoint
!     -   trapezium
!     -   Simpson's
!         -   composite
! 
! Your functions should take in the upper and lower bounds ( and ), and
! the number of approximations to make in that range ().
! 
! Assume that your example already has a function that gives values for .
! 
! Simpson's method is defined by the following pseudo-code:
! 
! +---------------------------------------------------------+
! | procedure quad_simpson_composite(f, a, b, n)            |
! |     h := (b - a) / n                                    |
! |     sum1 := f(a + h/2)                                  |
! |     sum2 := 0                                           |
! |                                                         |
! |     loop on i from 1 to (n - 1)                         |
! |         sum1 := sum1 + f(a + h * i + h/2)               |
! |         sum2 := sum2 + f(a + h * i)                     |
! |                                                         |
! |     answer := (h / 6) * (f(a) + f(b) + 4*sum1 + 2*sum2) |
! +---------------------------------------------------------+
! 
! : Pseudocode: Simpson's method, composite
! 
! Demonstrate your function by showing the results for:
! 
! -   , where x is [0,1], with 100 approximations. The exact result is
!     0.25 (or 1/4)
! 
! -   , where x is [1,100], with 1,000 approximations. The exact result is
!     4.605170⁺ (natural log of 100)
! 
! -   , where x is [0,5000], with 5,000,000 approximations. The exact
!     result is 12,500,000
! 
! -   , where x is [0,6000], with 6,000,000 approximations. The exact
!     result is 18,000,000
! 
! ;See also:
! 
! -   Active object for integrating a function of real time.
! -   Special:PrefixIndex/Numerical integration for other integration
!     methods.


USE: math.functions
IN: scratchpad 0 1 [ 3 ^ ] integrate-simpson .
1/4
IN: scratchpad 1000 num-steps set-global
IN: scratchpad 1.0 100 [ -1 ^ ] integrate-simpson .
4.605173316272971
IN: scratchpad 5000000 num-steps set-global
IN: scratchpad 0 5000 [ ] integrate-simpson .
12500000
IN: scratchpad 6000000 num-steps set-global
IN: scratchpad 0 6000 [ ] integrate-simpson .
18000000
