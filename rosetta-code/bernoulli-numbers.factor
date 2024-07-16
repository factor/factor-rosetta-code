! Bernoulli numbers are used in some series expansions of several
! functions (trigonometric, hyperbolic, gamma, etc.), and are extremely
! important in number theory and analysis.
! 
! Note that there are two definitions of Bernoulli numbers; this task will
! be using the modern usage (as per The National Institute of Standards
! and Technology convention).
! 
! The n^(th) Bernoulli number is expressed as B_(n).
! 
! Task
! 
! -   -   show the Bernoulli numbers B₀ through B₆₀.
!     -   suppress the output of values which are equal to zero. (Other
!         than B₁ , all odd Bernoulli numbers have a value of zero.)
!     -   express the Bernoulli numbers as fractions  (most are improper
!         fractions).
!     -   the fractions should be reduced.
!     -   index each number in some way so that it can be discerned which
!         Bernoulli number is being displayed.
!     -   align the solidi (/) if used  (extra credit).
! 
! An algorithm
! 
! The Akiyama–Tanigawa algorithm for the "second Bernoulli numbers" as
! taken from wikipedia is as follows:
! 
!  for m from 0 by 1 to n do
!     A[m] ← 1/(m+1)
!     for j from m by -1 to 1 do
!       A[j-1] ← j×(A[j-1] - A[j])
!   return A[0] (which is B_(n))
! 
! See also
! 
! -   Sequence A027641 Numerator of Bernoulli number B_n on The On-Line
!     Encyclopedia of Integer Sequences.
! -   Sequence A027642 Denominator of Bernoulli number B_n on The On-Line
!     Encyclopedia of Integer Sequences.
! -   Entry Bernoulli number on The Eric Weisstein's World of Mathematics
!     (TM).
! -   Luschny's The Bernoulli Manifesto for a discussion on B₁ = -½ versus
!     +½.

