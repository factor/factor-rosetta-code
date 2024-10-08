! The Miller–Rabin primality test or Rabin–Miller primality test is a
! primality test: an algorithm which determines whether a given number is
! prime or not.
! 
! The algorithm, as modified by Michael O. Rabin to avoid the generalized
! Riemann hypothesis, is a probabilistic algorithm.
! 
! The pseudocode, from Wikipedia is:
! 
! Input: n > 2, an odd integer to be tested for primality;
!        k, a parameter that determines the accuracy of the test
! Output: composite if n is composite, otherwise probably prime
! write n − 1 as 2^(s)·d with d odd by factoring powers of 2 from n − 1
! LOOP: repeat k times:
!    pick a randomly in the range [2, n − 1]
!    x ← a^(d) mod n
!    if x = 1 or x = n − 1 then do next LOOP
!    repeat s − 1 times:
!       x ← x² mod n
!       if x = 1 then return composite
!       if x = n − 1 then do next LOOP
!    return composite
! return probably prime
! 
! -   The nature of the test involves big numbers, so the use of "big
!     numbers" libraries (or similar features of the language of your
!     choice) are suggested, but not mandatory.
! -   Deterministic variants of the test exist and can be implemented as
!     extra (not mandatory to complete the task)


