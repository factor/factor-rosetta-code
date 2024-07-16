! The Mertens function M(x) is the count of square-free integers up to x
! that have an even number of prime factors, minus the count of those that
! have an odd number.
! 
! It is an extension of the Möbius function. Given the Möbius function
! μ(n), the Mertens function M(x) is the sum of the Möbius numbers from n
! == 1 through n == x.
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find the
!         Mertens number for any positive integer x.
! 
! -   -   Use that routine to find and display here, on this page, at
!         least the first 99 terms in a grid layout. (Not just one long
!         line or column of numbers.)
! 
! -   -   Use that routine to find and display here, on this page, the
!         number of times the Mertens function sequence is equal to zero
!         in the range M(1) through M(1000).
! 
! -   -   Use that routine to find and display here, on this page, the
!         number of times the Mertens function sequence crosses zero in
!         the range M(1) through M(1000). (Crossing defined as this term
!         equal to zero but preceding term not.)
! 
! See also:
! 
! -   -   Wikipedia: Mertens function
!     -   Wikipedia: Möbius function
!     -   OEIS: A002321 - Mertens's function
!     -   OEIS: A028442 - Numbers n such that Mertens's function M(n) is
!         zero
!     -   Numberphile - Mertens Conjecture
!     -   Stackexchange: compute the mertens function
! 
! This is not code golf. The stackexchange link is provided as an
! algorithm reference, not as a guide.
! 
! Related tasks:
! 
! -   -   Möbius function

USING: formatting grouping io kernel math math.extras
math.ranges math.statistics prettyprint sequences ;

! Take the cumulative sum of the mobius sequence to avoid
! summing lower terms over and over.
: mertens-upto ( n -- seq ) [1,b] [ mobius ] map cum-sum ;

"The first 199 terms of the Mertens sequence:" print
199 mertens-upto " " prefix 20 group
[ [ "%3s" printf ] each nl ] each nl

"In the first 1,000 terms of the Mertens sequence there are:"
print 1000 mertens-upto
[ [ zero? ] count bl pprint bl "zeros." print ]
[
    2 <clumps> [ first2 [ 0 = not ] [ zero? ] bi* and ] count bl
    pprint bl "zero crossings." print
] bi
