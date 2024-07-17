! Background
! 
! Goodstein sequences are sequences defined for a given counting number n
! by applying increasing bases to a representation of n after n has been
! used to construct a hereditary representation of that number, originally
! in base 2.
! 
! Start by defining the hereditary base-b representation of a number n.
! Write n as a sum of powers of b, staring with b = 2. For example, with n
! = 29, write 31 = 16 + 8 + 4 + 1. Now we write each exponent as a sum of
! powers of n, so as 2^4 + 2^3 + 2^1 + 2^0.
! 
! Continue by re-writing all of the current term's exponents that are
! still > b as a sum of terms that are <= b, using a sum of powers of b:
! so, n = 16 + 8 + 4 + 1 = 2^4 + 2^3 + 2 + 1 = 2^(2^2) + 2^(2 + 1) + 2 +
! 1.
! 
! If we consider this representation as a representation of a calculation
! with b = 2, we have the hereditary representation b^(b^b) + b^(b + 1) +
! b + 1.
! 
! Other integers and bases are done similarly. Note that an exponential
! term can be repeated up to (b - 1) times, so that, for example, if b =
! 5, 513 = b^3 + b^3 + b^3 + b^3 + b + b + 3 = 4 * b^3 + 2 * b + 3.
! 
! The Goodstein sequence for n, G(n) is then defined as follows:
! 
! The first term, considered the zeroeth term or G(n)(0), is always 0. The
! second term G(n)(1) is always n. For further terms, the m-th term
! G(n)(m) is defined by the following procedure:
! 
!    1. Write G(n)(m - 1) as a hereditary representation with base (m - 1).
!    2. Calculate the results of using the hereditary representation found in step 1 using base m rather than (m - 1)
!    3. Subtract 1 from the result calculated in step 2.
! 
! Task
! 
! -   Create a function to calculate the Goodstein sequence for a given
!     integer.
! 
! -   Use this to show the first 10 values of Goodstein(n) for the numbers
!     from 0 through 7.
! 
! -   Find the nth term (counting from 0) of Goodstein(n) for n from 0
!     through 10.
! 
! Stretch task
! 
! -   Find the nth term (counting from 0) of Goodstein(n) for n = 11
!     through 16.
! 
! See also
! 
! -   -   Wikipedia entry for Goodstein's theorem
!     -   OEIS Goodstein numbers such that a(n) = G_n(n), where G is the
!         Goodstein function
! 
! *  "Googology site article " 


