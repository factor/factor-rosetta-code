! Stirling numbers of the first kind, or Stirling cycle numbers, count
! permutations according to their number of cycles (counting fixed points
! as cycles of length one).
! 
! They may be defined directly to be the number of permutations of n
! elements with k disjoint cycles.
! 
! Stirling numbers of the first kind express coefficients of polynomial
! expansions of falling or rising factorials.
! 
! Depending on the application, Stirling numbers of the first kind may be
! "signed" or "unsigned". Signed Stirling numbers of the first kind arise
! when the polynomial expansion is expressed in terms of falling
! factorials; unsigned when expressed in terms of rising factorials. The
! only substantial difference is that, for signed Stirling numbers of the
! first kind, values of S1(n, k) are negative when n + k is odd.
! 
! Stirling numbers of the first kind follow the simple identities:
! 
!    S1(0, 0) = 1
!    S1(n, 0) = 0 if n > 0
!    S1(n, k) = 0 if k > n
!    S1(n, k) = S1(n - 1, k - 1) + (n - 1) * S1(n - 1, k) # For unsigned
!      or
!    S1(n, k) = S1(n - 1, k - 1) - (n - 1) * S1(n - 1, k) # For signed
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find Stirling
!         numbers of the first kind. There are several methods to generate
!         Stirling numbers of the first kind. You are free to choose the
!         most appropriate for your language. If your language has a
!         built-in, or easily, publicly available library implementation,
!         it is acceptable to use that.
! 
! -   -   Using the routine, generate and show here, on this page, a table
!         (or triangle) showing the Stirling numbers of the first kind,
!         S1(n, k), up to S1(12, 12). it is optional to show the row /
!         column for n == 0 and k == 0. It is optional to show places
!         where S1(n, k) == 0 (when k > n). You may choose to show signed
!         or unsigned Stirling numbers of the first kind, just make a note
!         of which was chosen.
! 
! -   -   If your language supports large integers, find and show here, on
!         this page, the maximum value of S1(n, k) where n == 100.
! 
! See also:
! 
! -   -   Wikipedia - Stirling numbers of the first kind
!     -   OEIS:A008275 - Signed Stirling numbers of the first kind
!     -   OEIS:A130534 - Unsigned Stirling numbers of the first kind
! 
! Related Tasks:
! 
! -   -   Stirling numbers of the second kind
!     -   Lah numbers

USING: arrays assocs formatting io kernel math math.polynomials
math.ranges prettyprint sequences ;
IN: rosetta-code.stirling-first

: stirling-row ( n -- seq )
    [ { 1 } ] [
        [ -1 ] dip neg [a,b) dup length 1 <array> zip
        { 0 1 } [ p* ] reduce [ abs ] map
    ] if-zero ;

"Unsigned Stirling numbers of the first kind:" print
"n\\k" write 13 dup [ "%10d" printf ] each-integer nl

[ dup "%-2d " printf stirling-row [ "%10d" printf ] each nl ]
each-integer nl

"Maximum value from 100th stirling row:" print
100 stirling-row supremum .
