! Using the in-built capabilities of your language, calculate the integer
! value of:
! 
!         5^(4^(3²))
! 
! -   Confirm that the first and last twenty digits of the answer are:
! 
!      62060698786608744707...92256259918212890625
! 
! -   Find and show the number of decimal digits in the answer.
! 
! Note:
! 
! -   Do not submit an implementation of arbitrary precision arithmetic.
!     The intention is to show the capabilities of the language as
!     supplied. If a language has a single, overwhelming, library of
!     varied modules that is endorsed by its home site – such as CPAN for
!     Perl or Boost for C++ – then that may be used instead.
! -   Strictly speaking, this should not be solved by fixed-precision
!     numeric libraries where the precision has to be manually set to a
!     large value; although if this is the only recourse then it may be
!     used with a note explaining that the precision must be set manually
!     to a large enough value.
! 
! Related tasks:
! 
! -   Long multiplication
! -   Exponentiation order
! -   exponentiation operator
! -   Exponentiation with infix operators in (or operating on) the base

USING: formatting kernel math.functions math.parser sequences ;
IN: rosettacode.bignums

: test-bignums ( -- )
    5 4 3 2 ^ ^ ^ number>string
    [ 20 head ] [ 20 tail* ] [ length ] tri
    "5^4^3^2 is %s...%s and has %d digits\n" printf ;
