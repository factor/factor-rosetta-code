! Task:
! 
! Compute the least common multiple (LCM) of two integers.
! 
! Given m and n, the least common multiple is the smallest positive
! integer that has both m and n as factors.
! 
! Example:
! 
! The least common multiple of 12 and 18 is 36, because:
! 
! -   -   12 is a factor (12 × 3 = 36), and
!     -   18 is a factor (18 × 2 = 36), and
!     -   there is no positive integer less than 36 that has both factors.
! 
! As a special case, if either m or n is zero, then the least common
! multiple is zero.
! 
! One way to calculate the least common multiple is to iterate all the
! multiples of m, until you find one that is also a multiple of n.
! 
! If you already have gcd for greatest common divisor, then this formula
! calculates lcm.
! 
!     
! 
!         $\operatorname{lcm}(m, n) = \frac{|m \times n|}{\operatorname{gcd}(m, n)}$
! 
! One can also find lcm by merging the prime decompositions of both m and
! n.
! 
! Related task
! 
! -   -   greatest common divisor.
! 
! See also:
! 
! -   MathWorld entry: Least Common Multiple.
! -   Wikipedia entry: Least common multiple.
! 
! Category:Recursion

USING: math.functions prettyprint ;
26 28 lcm .
