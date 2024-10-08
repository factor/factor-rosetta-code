! Task:
! 
! Test whether an integer is even or odd.
! 
! There is more than one way to solve this task:
! 
! -   Use the even and odd predicates, if the language provides them.
! -   Check the least significant digit. With binary integers, i
!     bitwise-and 1 equals 0 iff i is even, or equals 1 iff i is odd.
! -   Divide i by 2. The remainder equals 0 iff i is even. The remainder
!     equals +1 or -1 iff i is odd.
! -   Use modular congruences:
!     -   i ≡ 0 (mod 2) iff i is even.
!     -   i ≡ 1 (mod 2) iff i is odd.


