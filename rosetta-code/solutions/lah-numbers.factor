! Lah numbers, sometimes referred to as Stirling numbers of the third
! kind, are coefficients of polynomial expansions expressing rising
! factorials in terms of falling factorials.
! 
! Unsigned Lah numbers count the number of ways a set of n elements can be
! partitioned into k non-empty linearly ordered subsets.
! 
! Lah numbers are closely related to Stirling numbers of the first &
! second kinds, and may be derived from them.
! 
! Lah numbers obey the identities and relations:
! 
!   L(n, 0), L(0, k) = 0   # for n, k > 0
!   L(n, n) = 1
!   L(n, 1) = n!
!   L(n, k) =           ( n! * (n - 1)! ) / ( k! * (k - 1)! ) / (n - k)!      # For unsigned Lah numbers
!      or
!   L(n, k) = (-1)**n * ( n! * (n - 1)! ) / ( k! * (k - 1)! ) / (n - k)!      # For   signed Lah numbers
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find unsigned
!         Lah numbers. There are several methods to generate unsigned Lah
!         numbers. You are free to choose the most appropriate for your
!         language. If your language has a built-in, or easily, publicly
!         available library implementation, it is acceptable to use that.
! 
! -   -   Using the routine, generate and show here, on this page, a table
!         (or triangle) showing the unsigned Lah numbers, L(n, k), up to
!         L(12, 12). it is optional to show the row / column for n == 0
!         and k == 0. It is optional to show places where L(n, k) == 0
!         (when k > n).
! 
! -   -   If your language supports large integers, find and show here, on
!         this page, the maximum value of L(n, k) where n == 100.
! 
! See also:
! 
! -   -   Wikipedia - Lah number
!     -   OEIS:A105278 - Unsigned Lah numbers
!     -   OEIS:A008297 - Signed Lah numbers
! 
! Related Tasks:
! 
! -   -   Stirling numbers of the first kind
!     -   Stirling numbers of the second kind
!     -   Bell numbers

USING: combinators combinators.short-circuit formatting infix io
kernel locals math math.factorials math.ranges prettyprint
sequences ;
IN: rosetta-code.lah-numbers

! Yes, Factor can do infix arithmetic with local variables!
! This is a good use case for it.

INFIX:: (lah) ( n k -- m )
    ( factorial(n) * factorial(n-1) ) /
    ( factorial(k) * factorial(k-1) ) / factorial(n-k) ;

:: lah ( n k -- m )
    {
        { [ k 1 = ] [ n factorial ] }
        { [ k n = ] [ 1 ] }
        { [ k n > ] [ 0 ] }
        { [ k 1 < n 1 < or ] [ 0 ] }
        [ n k (lah) ]
    } cond ;

"Unsigned Lah numbers: n k lah:" print
"n\\k" write 13 dup [ "%11d" printf ] each-integer nl

<iota> [
    dup dup "%-2d " printf [0,b] [
        lah "%11d" printf
    ] with each nl
] each nl

"Maximum value from the 100 _ lah row:" print
100 [0,b] [ 100 swap lah ] map supremum .
