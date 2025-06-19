! Lunar arithmetic is a version of arithmetic in which the addition and
! multiplication on digits are defined as the max and min operations.
! Thus, in lunar arithmetic,
! 
! 2 + 7 = max {2, 7} = 7
! and 2 × 7 = min {2, 7} = 2. The lunar arithmetic operations on
! nonnegative multidigit numbers are performed as in usual arithmetic as
! illustrated in the following examples. The world of lunar arithmetic is
! restricted to the set of nonnegative integers.
! 
!  976 +
!  348
!  ----
!  978 (adding digits column-wise)
! 
!     976 ×
!     348
!    ----
!    876 (multiplying the digits of 976 by 8)
!   444  (multiplying the digits of 976 by 4)
!  333   (multiplying the digits of 976 by 3)
!  ------
!  34876 (adding digits column-wise)
! 
! A few important properties of lunar arithmetic
! 
! 1.  The lunar addition and multiplication operations satisfy the
!     Commutative and Associative property laws.
! 2.  The lunar multiplication distributes over the lunar addition.
! 3.  The digit 0 is the additive identity under lunar addition.
! 4.  The digit 9 is the multiplicative identity under lunar
!     multiplication.
! 
! Note that lunar arithmetic can be done in any base. This task is
! restricted to base 10 only.
! 
! Task
! 
! Implement lunar addition and lunar multiplication routines. Extra kudos
! for implementing them as operators.
! 
! Use those routines (operators) to perform the following:
! 
! -   Lunar addition and lunar multiplication of the number groups: (976,
!     348), (23, 321), (232, 35), (123, 32192, 415, 8)
! -   Using lunar arithmetic, find the first twenty distinct even numbers.
!     n + n ≠ 2 × n and n + n = n. The even numbers are numbers of the
!     form 2 × n.
! -   Using lunar arithmetic, find the first twenty square numbers. n × n
! -   Using lunar arithmetic, find the first twenty factorial numbers.
!     n! = 1 × 2 × ⋯ × n
! 
! Stretch
! 
! The lunar squares sequence is not monotonic. Squared values are not
! strictly increasing as the numbers grow larger.
! 
! -   Find the first number whose lunar square is smaller than the
!     previous.
! 
! See also
!     OEIS A087019 - Lunar squares
!     OEIS A189788 - Base-10 lunar factorials
!     Tropical algebra overloading


