! Signum: Sign of an integer - represent the sign of an integer using a
! value from a set of 3 or 4 integers.
! 
! Task:
! 
! Create a function that takes a signed integer x, and returns another
! signed integer as follows:
! 
! -   if x<0, return -1,
! -   if x>0, return 1 (positive 1),
! -   if x=0, return 0.
! 
! If the integer representation used supports a signed zero, then the
! function should preserve the sign of the zero. That is,
! 
! -   if x=-0, return -0,
! -   if x=+0, return +0.
! 
! Example:
! 
!     
! 
!         {|class="standard"
! 
! ! input 
! ! output 
! |-
! |-10
! |-1
! |-
! |42
! |1
! |-
! |0
! |0
! |}
! 
! Additional example for integer types with a signed zero (uncommon):
! 
!     
! 
!         {|class="standard"
! 
! ! input 
! ! output 
! |-
! |-0
! |-0
! |}
! 
! Category:Simple


