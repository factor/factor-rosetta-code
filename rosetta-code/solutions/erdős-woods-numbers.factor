! Description
! 
! A positive integer k is said to be an Erdős–Woods number if it has the
! following property: there exists a positive integer a such that in the
! sequence (a, a + 1, …, a + k) of consecutive integers, each of the
! elements has a non-trivial common factor with one of the endpoints. In
! other words, k is an Erdős–Woods number if there exists a positive
! integer a such that for each integer i between 0 and k, at least one of
! the greatest common divisors gcd(a, a + i) or gcd(a + i, a + k) is
! greater than 1.
! 
! It can be shown that there are infinitely many such numbers. Moreover,
! if k is an E-W number for some integer a, then one can find an infinite
! number of other a's using the formula a(jq + 1) where:
! 
! -   q is the product of all odd prime factors of a + k; and
! -   j is any positive integer.
! 
! Example
! 
! 16 is an E-W number (and also the first) for which the smallest value of
! a is 2184. This is because in the sequence 2184 to 2200 inclusive, the
! prime factors of the endpoints are:
! 
! -   2³ x 3 x 7 x 13 = 2184
! -   2³ x 5² x 11 = 2200
! 
! and, if you check all the numbers between them, you will find that they
! all have a prime factor in common with at least one of the endpoints
! (2189 is divisible by 11, 2191 by 7, 2197 by 13 and the rest by either
! 2, 3, or 5).
! 
! Task
! 
! Compute and show here the first 20 E-W numbers together with their
! corresponding smallest value of a. If your language doesn't support
! arbitrary precision arithmetic, just compute and show as many as you
! can.
! 
! Extra credit
! 
! Do the same for the next 20 E-W numbers.
! 
! Note
! 
! Although all the E-W numbers relevant to this task are even, odd
! examples do exist the first one being k = 903.
! 
! References
! 
! -   OEIS sequence A059756: Erdős–Woods numbers.
! -   OEIS sequence A059757: Smallest values of a for a given E-W number
!     k.
! -   Planet Math: Erdős–Woods numbers.


