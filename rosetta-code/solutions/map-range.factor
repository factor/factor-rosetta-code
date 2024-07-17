! Given two ranges:
! 
! -   -   [a₁, a₂] and
!     -   [b₁, b₂];
!     -   then a value s in range [a₁, a₂]
!     -   is linearly mapped to a value t in range [b₁, b₂]
! 
! where:
! 
! -   -   $t = b_1 + {(s - a_1)(b_2 - b_1) \over (a_2 - a_1)}$
! 
! Task:
! 
! Write a function/subroutine/... that takes two ranges and a real number,
! and returns the mapping of the real number from the first to the second
! range.
! 
! Use this function to map values from the range [0, 10] to the range
! [-1, 0].
! 
! Extra credit:
! 
! Show additional idiomatic ways of performing the mapping, using tools
! available to the language.

USE: locals
:: map-range ( a1 a2 b1 b2 x -- y )
   x a1 - b2 b1 - * a2 a1 - / b1 + ;
