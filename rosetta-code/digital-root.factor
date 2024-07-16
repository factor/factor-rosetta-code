! The digital root, X, of a number, n, is calculated:
! 
!     find X as the sum of the digits of n
!     find a new X by summing the digits of X, repeating until X has only
!     one digit.
! 
! The additive persistence is the number of summations required to obtain
! the single digit.
! 
! The task is to calculate the additive persistence and the digital root
! of a number, e.g.:
! 
! 627615
! has additive persistence 2 and digital root of 9;
! 
! 39390
! has additive persistence 2 and digital root of 6;
! 
! 588225
! has additive persistence 2 and digital root of 3;
! 
! 393900588225
! has additive persistence 2 and digital root of 9;
! 
! The digital root may be calculated in bases other than 10.
! 
! See:
! 
! -   Casting out nines for this wiki's use of this procedure.
! -   Digital root/Multiplicative digital root
! -   Sum digits of an integer
! -   Digital root sequence on OEIS
! -   Additive persistence sequence on OEIS
! -   Iterated digits squaring

USING: arrays formatting kernel math math.text.utils sequences ;
IN: rosetta-code.digital-root

: digital-root ( n -- persistence root )
    0 swap [ 1 digit-groups dup length 1 > ] [ sum [ 1 + ] dip ]
    while first ;
 
: print-root ( n -- )
    dup digital-root
    "%-12d has additive persistence %d and digital root %d.\n"
    printf ;
 
{ 627615 39390 588225 393900588225 } [ print-root ] each
