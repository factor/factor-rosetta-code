! category:Prime Numbers In 1939, Jack Chernick proved that, for n ≥ 3 and
! m ≥ 1:
! 
!    U(n, m) = (6m + 1) * (12m + 1) * Product_{i=1..n-2} (2^i * 9m + 1)
! 
! is a Carmichael number if all the factors are primes and, for n > 4, m
! is a multiple of 2^(n-4).
! 
! Example
! 
!    U(3, m) = (6m + 1) * (12m + 1) * (18m + 1)
!    U(4, m) = U(3, m) * (2^2 * 9m + 1)
!    U(5, m) = U(4, m) * (2^3 * 9m + 1)
!    ...
!    U(n, m) = U(n-1, m) * (2^(n-2) * 9m + 1)
! 
! -   The smallest Chernick's Carmichael number with 3 prime factors, is:
!     U(3, 1) = 1729.
! -   The smallest Chernick's Carmichael number with 4 prime factors, is:
!     U(4, 1) = 63973.
! -   The smallest Chernick's Carmichael number with 5 prime factors, is:
!     U(5, 380) = 26641259752490421121.
! 
! For n = 5, the smallest number m that satisfy Chernick's conditions, is
! m = 380, therefore U(5, 380) is the smallest Chernick's Carmichael
! number with 5 prime factors.
! 
! U(5, 380) is a Chernick's Carmichael number because m = 380 is a
! multiple of 2^(n-4), where n = 5, and the factors { (6*380 + 1),
! (12*380 + 1), (18*380 + 1), (36*380 + 1), (72*380 + 1) } are all prime
! numbers.
! 
! Task
! 
! For n ≥ 3, let a(n) be the smallest Chernick's Carmichael number with n
! prime factors.
! 
! -   Compute a(n) for n = 3..9.
! -   Optional: find a(10).
! 
! Note: it's perfectly acceptable to show the terms in factorized form:
! 
!  a(3) = 7 * 13 * 19
!  a(4) = 7 * 13 * 19 * 37
!  a(5) = 2281 * 4561 * 6841 * 13681 * 27361
!  ...
! 
! See also
! 
! -   Jack Chernick, On Fermat's simple theorem (PDF)
! 
! -   OEIS A318646: The least Chernick's "universal form" Carmichael
!     number with n prime factors
! 
! Related tasks
! 
! -   Carmichael 3 strong pseudoprimes


