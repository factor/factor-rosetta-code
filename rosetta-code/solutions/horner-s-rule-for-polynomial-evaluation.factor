! A fast scheme for evaluating a polynomial such as:
! 
!     −19 + 7x − 4x² + 6x³ 
! 
! when
! 
!     x = 3 .
! 
! is to arrange the computation as follows:
! 
!     ((((0)x + 6)x + (−4))x + 7)x + (−19) 
! 
! And compute the result from the innermost brackets outwards as in this
! pseudocode:
! 
! coefficients := [-19, 7, -4, 6] # list coefficients of all x^0..x^n in order
! x := 3
! accumulator := 0
! for i in length(coefficients) downto 1 do
!     # Assumes 1-based indexing for arrays
!     accumulator := ( accumulator * x ) + coefficients[i]
! done
! # accumulator now has the answer
! 
! Task Description
! 
!     Create a routine that takes a list of coefficients of a polynomial
!     in order of increasing powers of x; together with a value of x to
!     compute its value at, and return the value of the polynomial at that
!     value using Horner's rule.
! 
! Cf. Formal power series

: horner ( coeff x -- res )
    [ <reversed> 0 ] dip '[ [ _ * ] dip + ] reduce ;
