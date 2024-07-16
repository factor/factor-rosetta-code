! Task:
! 
! Take a Natural Number in a given base and return the sum of its digits:
! 
! -   -   1₁₀ sums to 1
!     -   1234₁₀ sums to 10
!     -   fe₁₆ sums to 29
!     -   f0e₁₆ sums to 29

: sum-digits ( base n -- sum ) 0 swap [ dup zero? ] [ pick /mod swapd + swap ] until drop nip ;

{ 10 10 16 16 } { 1 1234 0xfe 0xf0e } [ sum-digits ] 2each
