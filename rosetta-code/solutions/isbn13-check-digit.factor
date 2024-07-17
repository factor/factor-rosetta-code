! Task:
! 
! Validate the check digit of an ISBN-13 code:
! 
! -   -   Multiply every other digit by 3.
!     -   Add these numbers and the other digits.
!     -   Take the remainder of this number after division by 10.
!     -   If it is 0, the ISBN-13 check digit is correct.
! 
! You might use the following codes for testing:
! 
! -   -   978-0596528126 (good)
!     -   978-0596528120 (bad)
!     -   978-1788399081 (good)
!     -   978-1788399083 (bad)
! 
! Show output here, on this page
! 
! See also:
! 
! -   -   for details: 13-digit ISBN method of validation. (installs
!         cookies.)

USING: combinators.short-circuit formatting kernel math
math.functions math.parser math.vectors qw sequences
sequences.extras sets unicode ;

: (isbn13?) ( str -- ? )
    string>digits
    [ <evens> sum ] [ <odds> 3 v*n sum + ] bi 10 divisor? ;

: isbn13? ( str -- ? )
    "- " without
    { [ length 13 = ] [ [ digit? ] all? ] [ (isbn13?) ] } 1&& ;

qw{ 978-0596528126 978-0596528120 978-1788399081 978-1788399083 }
[ dup isbn13? "good" "bad" ? "%s: %s\n" printf ] each
