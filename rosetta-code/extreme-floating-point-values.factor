! The IEEE floating point specification defines certain 'extreme' floating
! point values such as minus zero, -0.0, a value distinct from plus zero;
! not a number, NaN; and plus and minus infinity.
! 
! The task is to use expressions involving other 'normal' floating point
! values in your language to calculate these, (and maybe other), extreme
! floating point values in your language and assign them to variables.
! 
! Print the values of these variables if possible; and show some
! arithmetic with these values and variables.
! 
! If your language can directly enter these extreme floating point values
! then show it.
! 
! See also:
! 
! -   What Every Computer Scientist Should Know About Floating-Point
!     Arithmetic
! 
! Related tasks:
! 
! -   Infinity
! -   Detect division by zero
! -   Literals/Floating point

-0.             . ! -0.0  literal negative zero
 0. neg         . ! -0.0  neg works with floating point zeros
 0. -1. *       . ! -0.0  calculating negative zero
 1/0.           . !  1/0. literal positive infinity
 1e3 1e3 ^      . !  1/0. calculating positive infinity
-1/0.           . ! -1/0. literal negative infinity
-1. 1e3 1e3 ^ * . ! -1/0. calculating negative infinity
-1/0. neg       . !  1/0. neg works with the inifinites
 0/0.           . !  NAN: 8000000000000 literal NaN, configurable with
                  !                     arbitrary 64-bit hex payload
 1/0. 1/0. -    . !  NAN: 8000000000000 calculating NaN by subtracting
                  !                     infinity from infinity
