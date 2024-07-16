! Task:
! 
! Write a function to compute the arithmetic-geometric mean of two
! numbers.
! 
! The arithmetic-geometric mean of two numbers can be (usefully) denoted
! as agm(a, g), and is equal to the limit of the sequence:
! 
!     a₀ = a;   g₀ = g
!     $a_{n+1} = \tfrac{1}{2}(a_n + g_n); \quad g_{n+1} = \sqrt{a_n g_n}.$
! 
! Since the limit of a_(n) − g_(n) tends (rapidly) to zero with
! iterations, this is an efficient method.
! 
! Demonstrate the function by calculating:
! 
! $$\mathrm{agm}(1,1/\sqrt{2})$$
! 
! Also see:
! 
! -   mathworld.wolfram.com/Arithmetic-Geometric Mean

USING: kernel math math.functions prettyprint ;
IN: rosetta-code.arithmetic-geometric-mean

: agm ( a g -- a' g' ) 2dup [ + 0.5 * ] 2dip * sqrt ;

1 1 2 sqrt / [ 2dup - 1e-15 > ] [ agm ] while drop .
