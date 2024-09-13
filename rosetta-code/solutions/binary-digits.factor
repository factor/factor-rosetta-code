! Task:
! 
! Create and display the sequence of binary digits for a given
! non-negative integer.
! 
!    The decimal value     5  should produce an output of              101
!    The decimal value    50  should produce an output of           110010
!    The decimal value  9000  should produce an output of   10001100101000
! 
! The results can be achieved using built-in radix functions within the
! language (if these are available), or alternatively a user defined
! function can be used.
! 
! The output produced should consist just of the binary digits of each
! number followed by a newline.
! 
! There should be no other whitespace, radix or sign markers in the
! produced output, and leading zeros should not appear in the results.
! 
! Category:Radices

USING: io kernel math math.parser ;

5 >bin print
50 >bin print
9000 >bin print
