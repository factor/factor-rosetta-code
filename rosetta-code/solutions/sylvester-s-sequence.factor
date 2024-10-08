! In number theory, Sylvester's sequence is an integer sequence in which
! each term of the sequence is the product of the previous terms, plus
! one.
! 
! Its values grow doubly exponentially, and the sum of its reciprocals
! forms a series of unit fractions that converges to 1 more rapidly than
! any other series of unit fractions with the same number of terms.
! 
! Further, the sum of the first k terms of the infinite series of
! reciprocals provides the closest possible underestimate of 1 by any
! k-term Egyptian fraction.
! 
! Task:
! 
! -   Write a routine (function, procedure, generator, whatever) to
!     calculate Sylvester's sequence.
! -   Use that routine to show the values of the first 10 elements in the
!     sequence.
! -   Show the sum of the reciprocals of the first 10 elements on the
!     sequence, ideally as an exact fraction.
! 
! Related tasks:
! 
! -   Egyptian fractions
! -   Harmonic series
! 
! See also:
! 
! -   OEIS A000058 - Sylvester's sequence

USING: io kernel lists lists.lazy math prettyprint ;

: lsylvester ( -- list ) 2 [ dup sq swap - 1 + ] lfrom-by ;

"First 10 elements of Sylvester's sequence:" print
10 lsylvester ltake dup [ . ] leach nl

"Sum of the reciprocals of first 10 elements:" print
0 [ recip + ] foldl .
