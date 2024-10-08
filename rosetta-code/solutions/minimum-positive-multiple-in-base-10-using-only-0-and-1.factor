! Every positive integer has infinitely many base-10 multiples that only
! use the digits 0 and 1. The goal of this task is to find and display the
! minimum multiple that has this property.
! 
! This is simple to do, but can be challenging to do efficiently.
! 
! To avoid repeating long, unwieldy phrases, the operation "minimum
! positive multiple of a positive integer n in base 10 that only uses the
! digits 0 and 1" will hereafter be referred to as "B10".
! 
! Task:
! 
! Write a routine to find the B10 of a given integer.
! 
! E.G.
! 
!       n                  B10      n  × multiplier
!       1                    1    ( 1  × 1         )
!       2                   10    ( 2  × 5         )
!       7                 1001    ( 7  x 143       )
!       9            111111111    ( 9  x 12345679  )
!      10                   10    ( 10 x 1         )
! 
! and so on.
! 
! Use the routine to find and display here, on this page, the B10 value
! for:
! 
!    1 through 10, 95 through 105, 297, 576, 594, 891, 909, 999
! 
! Optionally find B10 for:
! 
!    1998, 2079, 2251, 2277
! 
! Stretch goal; find B10 for:
! 
!    2439, 2997, 4878
! 
! There are many opportunities for optimizations, but avoid using magic
! numbers as much as possible. If you do use magic numbers, explain
! briefly why and what they do for your implementation.
! 
! See also:
! 
! -   -   OEIS:A004290 Least positive multiple of n that when written in
!         base 10 uses only 0's and 1's.
!     -   How to find Minimum Positive Multiple in base 10 using only 0
!         and 1

: is-1-or-0 ( char -- ? ) dup CHAR: 0 = [ drop t ] [ CHAR: 1 = ] if ;
: int-is-B10 ( n -- ? ) unparse [ is-1-or-0 ] all? ;
: B10-step ( x x -- x x ? ) dup int-is-B10 [ f ] [ over + t ] if ;
: find-B10 ( x -- x ) dup [ B10-step ] loop nip ;
