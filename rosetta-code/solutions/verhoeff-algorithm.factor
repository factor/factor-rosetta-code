! Description
! 
! The Verhoeff algorithm is a checksum formula for error detection
! developed by the Dutch mathematician Jacobus Verhoeff and first
! published in 1969. It was the first decimal check digit algorithm which
! detects all single-digit errors, and all transposition errors involving
! two adjacent digits, which was at the time thought impossible with such
! a code.
! 
! As the workings of the algorithm are clearly described in the linked
! Wikipedia article they will not be repeated here.
! 
! Task:
! 
! Write routines, methods, procedures etc. in your language to generate a
! Verhoeff checksum digit for non-negative integers of any length and to
! validate the result. A combined routine is also acceptable.
! 
! The more mathematically minded may prefer to generate the 3 tables
! required from the description provided rather than to hard-code them.
! 
! Write your routines in such a way that they can optionally display digit
! by digit calculations as in the Wikipedia example.
! 
! Use your routines to calculate check digits for the integers: 236, 12345
! and 123456789012 and then validate them. Also attempt to validate the
! same integers if the check digits in all cases were 9 rather than what
! they actually are.
! 
! Display digit by digit calculations for the first two integers but not
! for the third.
! 
! Related task:
! 
! -   Damm algorithm


