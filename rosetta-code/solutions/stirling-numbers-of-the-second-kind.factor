! Stirling numbers of the second kind, or Stirling partition numbers, are
! the number of ways to partition a set of n objects into k non-empty
! subsets. They are closely related to Bell numbers, and may be derived
! from them.
! 
! Stirling numbers of the second kind obey the recurrence relation:
! 
!    S2(n, 0) and S2(0, k) = 0 # for n, k > 0
!    S2(n, n) = 1
!    S2(n + 1, k) = k * S2(n, k) + S2(n, k - 1)
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find Stirling
!         numbers of the second kind. There are several methods to
!         generate Stirling numbers of the second kind. You are free to
!         choose the most appropriate for your language. If your language
!         has a built-in, or easily, publicly available library
!         implementation, it is acceptable to use that.
! 
! -   -   Using the routine, generate and show here, on this page, a table
!         (or triangle) showing the Stirling numbers of the second kind,
!         S2(n, k), up to S2(12, 12). it is optional to show the row /
!         column for n == 0 and k == 0. It is optional to show places
!         where S2(n, k) == 0 (when k > n).
! 
! -   -   If your language supports large integers, find and show here, on
!         this page, the maximum value of S2(n, k) where n == 100.
! 
! See also:
! 
! -   -   Wikipedia - Stirling numbers of the second kind
!     -   OEIS:A008277 - Stirling numbers of the second kind
! 
! Related Tasks:
! 
! -   -   Stirling numbers of the first kind
!     -   Bell numbers
!     -   Lah numbers

USING: combinators.short-circuit formatting io kernel math
math.extras prettyprint sequences ;
RENAME: stirling math.extras => (stirling)
IN: rosetta-code.stirling-second

! Tweak Factor's in-built stirling function for k=0
: stirling ( n k -- m )
    2dup { [ = not ] [ nip zero? ] } 2&&
    [ 2drop 0 ] [ (stirling) ] if ;

"Stirling numbers of the second kind: n k stirling:" print
"n\\k" write 13 dup [ "%8d" printf ] each-integer nl

<iota> [
    dup dup "%-2d " printf [0,b] [
        stirling "%8d" printf
    ] with each nl
] each nl

"Maximum value from the 100 _ stirling row:" print
100 <iota> [ 100 swap stirling ] map supremum .
