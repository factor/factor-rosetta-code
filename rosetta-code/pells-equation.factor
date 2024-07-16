! Pell's equation (also called the Pell–Fermat equation) is a Diophantine
! equation of the form:
! 
!          x² - ny² = 1
! 
! with integer solutions for x and y, where n is a given non-square
! positive integer.
! 
! Task requirements:
! 
! -   -   find the smallest solution in positive integers to Pell's
!         equation for n = {61, 109, 181, 277}.
! 
! See also:
! 
! -   -   Wikipedia entry: Pell's equation.

USING: formatting kernel locals math math.functions sequences ;

:: solve-pell ( n -- a b )

    n sqrt >integer :> x!
    x :> y!
    1 :> z!
    2 x * :> r!

    1 0 :> ( e1! e2! )
    0 1 :> ( f1! f2! )
    0 0 :> ( a! b! )

    [ a sq b sq n * - 1 = ] [
        
        r z * y - y!
        n y sq - z / floor z!
        x y + z / floor r!

        e2 r e2 * e1 + e2! e1!
        f2 r f2 * f1 + f2! f1!

        e2 x f2 * + a!
        f2 b!

    ] until
    a b ;

{ 61 109 181 277 } [
    dup solve-pell
    "x^2 - %3d*y^2 = 1 for x = %-21d and y = %d\n" printf
] each
