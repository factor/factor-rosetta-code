! Zsigmondy numbers n to a, b, are the greatest divisor of a^(n) - b^(n)
! that is coprime to a^(m) - b^(m) for all positive integers m < n.
! 
! E.G.
! 
! Suppose we set a = 2 and b = 1. (Zs(n,2,1))
! 
! For each n, find the divisors of a^(n) - b^(n) and return the largest
! that is coprime to all of a^(m) - b^(m), where m is each of the positive
! integers 1 to n - 1.
! 
! When n = 4, 2⁴ - 1⁴ = 15. The divisors of 15 are 1, 3, 5, and 15.
! 
! For m = 1, 2, 3 we get 2-1, 2²-1², 2³-1³, or 1, 3, 7.
! 
! The divisors of 15 that are coprime to each are 5 and 1, (1 is always
! included).
! 
! The largest coprime divisor is 5, so Zs(4,2,1) = 5.
! 
! When n = 6, 2⁶ - 1⁶ = 63; its divisors are 1, 3, 7, 9, 21, 63. The
! largest divisor coprime to all of 1, 3, 7, 15, 31 is 1, (1 is always
! included), so Zs(6,2,1) = 1.
! 
! If a particular a^(n) - b^(n) is prime, then Zs(n,a,b) will be equal to
! that prime. 2⁵ - 1⁵ = 31 so Zs(5,2,1) = 31.
! 
! Task
! 
! -   Write a general routine (function, procedure, whatever) to find the
!     Zsigmondy number sequence given a set of radices.
! -   Use that routine to generate the first several elements, (at least
!     10), for the following radix sets.
!     -   (2,1)
!     -   (3,1)
!     -   (4,1)
!     -   (5,1)
!     -   (6,1)
!     -   (7,1)
!     -   (3,2)
!     -   (5,3)
!     -   (7,3)
!     -   (7,5)
! 
! See also
! * OEIS:A064078 - Zsigmondy numbers for a = 2, b = 1
! * OEIS:A064077 - Zsigmondy numbers for a = 3, b = 1
! * OEIS:A064080 - Zsigmondy numbers for a = 4, b = 1
! * OEIS:A064081 - Zsigmondy numbers for a = 5, b = 1
! * OEIS:A064082 - Zsigmondy numbers for a = 6, b = 1
! * OEIS:A064083 - Zsigmondy numbers for a = 7, b = 1
! * OEIS:A109325 - Zsigmondy numbers for a = 3, b = 2
! * OEIS:A109347 - Zsigmondy numbers for a = 5, b = 3
! * OEIS:A109348 - Zsigmondy numbers for a = 7, b = 3
! * OEIS:A109349 - Zsigmondy numbers for a = 7, b = 5


