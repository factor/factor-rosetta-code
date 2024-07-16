! Task:
! 
! Find the greatest common divisor (GCD) of two integers.
! 
! Greatest common divisor is also known as greatest common factor (gcf)
! and greatest common measure.
! 
! Related task:
! 
! -   -   least common multiple.
! 
! See also:
! 
! -   -   MathWorld entry: greatest common divisor.
!     -   Wikipedia entry: greatest common divisor.

: gcd ( a b -- c )
    [ abs ] [
        [ nip ] [ mod ] 2bi gcd
    ] if-zero ;
