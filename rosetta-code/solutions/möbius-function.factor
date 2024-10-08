! The classical Möbius function: μ(n) is an important multiplicative
! function in number theory and combinatorics.
! 
! There are several ways to implement a Möbius function.
! 
! A fairly straightforward method is to find the prime factors of a
! positive integer n, then define μ(n) based on the sum of the primitive
! factors. It has the values {−1, 0, 1} depending on the factorization of
! n:
! 
! -   -   μ(1) is defined to be 1.
! 
! -   -   μ(n) = 1 if n is a square-free positive integer with an even
!         number of prime factors.
! 
! -   -   μ(n) = −1 if n is a square-free positive integer with an odd
!         number of prime factors.
! 
! -   -   μ(n) = 0 if n has a squared prime factor.
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) μ(n) to find the
!         Möbius number for a positive integer n.
! 
! -   -   Use that routine to find and display here, on this page, at
!         least the first 99 terms in a grid layout. (Not just one long
!         line or column of numbers.)
! 
! See also:
! 
! **; Wikipedia: Möbius function
! 
! Related Tasks:
! 
! **; Mertens function

USING: formatting grouping io math.extras math.ranges sequences ;

"First 199 terms of the Möbius sequence:" print
199 [1,b] [ mobius ] map " " prefix 20 group
[ [ "%3s" printf ] each nl ] each
