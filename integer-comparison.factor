! Get two integers from the user.
! 
! Then, display a message if the first integer is:
! 
! -   -   less than,
!     -   equal to, or
!     -   greater than
! 
! the second integer.
! 
! Test the condition for each case separately, so that all three
! comparison operators are used in the code.
! 
! Related task:
! 
! -   String comparison
! 
! Category:Simple

: example ( -- ) 
readln readln [ string>number ] bi@ 
[ > [ "A > B" print ] when ]
[ < [ "A < B" print ] when ]
[ = [ "A = B" print ] when ] 2tri ;
