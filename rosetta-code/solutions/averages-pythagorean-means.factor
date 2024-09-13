! Task
! 
! Compute all three of the Pythagorean means of the set of integers 1
! through 10 (inclusive).
! 
! Show that A(x₁, …, x_(n)) ≥ G(x₁, …, x_(n)) ≥ H(x₁, …, x_(n)) for this
! set of positive integers.
! 
! -   The most common of the three means, the arithmetic mean, is the sum
!     of the list divided by its length:
! 
!     $A(x_1, \ldots, x_n) = \frac{x_1 + \cdots + x_n}{n}$
! 
! -   The geometric mean is the nth root of the product of the list:
! 
!     $G(x_1, \ldots, x_n) = \sqrt[n]{x_1 \cdots x_n}$
! 
! -   The harmonic mean is n divided by the sum of the reciprocal of each
!     item in the list:
! 
!     $H(x_1, \ldots, x_n) = \frac{n}{\frac{1}{x_1} + \cdots + \frac{1}{x_n}}$
! 
! Category:Geometry

: a-mean ( seq -- mean )
    [ sum ] [ length ] bi / ;

: g-mean ( seq -- mean )
    [ product ] [ length recip ] bi ^ ;

: h-mean ( seq -- mean )
    [ length ] [ [ recip ] map-sum ] bi / ;
