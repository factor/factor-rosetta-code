!     In algebra, polynomial long division is an algorithm for dividing a
!     polynomial by another polynomial of the same or lower degree.
! 
! Let us suppose a polynomial is represented by a vector, x (i.e., an
! ordered collection of coefficients) so that the i^(th) element keeps the
! coefficient of x^(i), and the multiplication by a monomial is a shift of
! the vector's elements "towards right" (injecting ones from left)
! followed by a multiplication of each element by the coefficient of the
! monomial.
! 
! Then a pseudocode for the polynomial long division using the conventions
! described above could be:
! 
! degree(P):
!   return the index of the last non-zero element of P;
!          if all elements are 0, return -∞
! polynomial_long_division(N, D) returns (q, r):
!   // N, D, q, r are vectors
!   if degree(D) < 0 then error
!   q ← 0
!   while degree(N) ≥ degree(D)
!     d ← D shifted right by (degree(N) - degree(D))
!     q(degree(N) - degree(D)) ← N(degree(N)) / d(degree(d))
!     // by construction, degree(d) = degree(N) of course
!     d ← d * q(degree(N) - degree(D))
!     N ← N - d
!   endwhile
!   r ← N
!   return (q, r)
! 
! Note: vector * scalar multiplies each element of the vector by the
! scalar; vectorA - vectorB subtracts each element of the vectorB from the
! element of the vectorA with "the same index". The vectors in the
! pseudocode are zero-based.
! 
! -   Error handling (for allocations or for wrong inputs) is not
!     mandatory.
! -   Conventions can be different; in particular, note that if the first
!     coefficient in the vector is the highest power of x for the
!     polynomial represented by the vector, then the algorithm becomes
!     simpler.
! 
! Example for clarification
! 
! This example is from Wikipedia, but changed to show how the given
! pseudocode works.
! 
!       0    1    2    3
!    ----------------------
! N:  -42    0  -12    1        degree = 3
! D:   -3    1    0    0        degree = 1
!    d(N) - d(D) = 2, so let's shift D towards right by 2:
! N:  -42    0  -12    1
! d:    0    0   -3    1
!    N(3)/d(3) = 1, so d is unchanged. Now remember that "shifting by 2"
!    is like multiplying by x², and the final multiplication
!    (here by 1) is the coefficient of this monomial. Let's store this
!    into q:
!                                0     1     2
!                               ---------------
!                           q:   0     0     1
!    now compute N - d, and let it be the "new" N, and let's loop
! N:  -42    0   -9    0        degree = 2
! D:   -3    1    0    0        degree = 1
!    d(N) - d(D) = 1, right shift D by 1 and let it be d
! N:  -42    0   -9    0
! d:    0   -3    1    0        * -9/1 = -9
!                           q:   0    -9     1
! d:    0   27   -9    0        
!    N ← N - d
! N:  -42  -27    0    0        degree = 1
! D:   -3    1    0    0        degree = 1
!    looping again... d(N)-d(D)=0, so no shift is needed; we
!    multiply D by -27 (= -27/1) storing the result in d, then
!                           q:  -27   -9     1
!    and
! N:  -42  -27    0    0        -
! d:   81  -27    0    0        =
! N: -123    0    0    0        (last N)
!     d(N) < d(D), so now r ← N, and the result is:
!        0   1  2
!    -------------
! q:   -27  -9  1   →  x² - 9x - 27
! r:  -123   0  0   →          -123
! 
! Related task:
! 
! -   -   Polynomial derivative

USE: math.polynomials

{ -42 0 -12 1 } { -3 1 } p/mod ptrim [ . ] bi@
