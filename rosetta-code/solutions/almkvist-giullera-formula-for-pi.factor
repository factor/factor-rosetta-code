! The Almkvist-Giullera formula for calculating 1/π² is based on the
! Calabi-Yau differential equations of order 4 and 5, which were
! originally used to describe certain manifolds in string theory.
! 
! The formula is:
! 
!     
! 
!         1/π² = (2⁵/3) ∑₀^(∞) ((6n)! / (n!⁶))(532n² + 126n + 9) /
!         1000^(2n+1)
! 
! This formula can be used to calculate the constant π⁻², and thus to
! calculate π.
! 
! Note that, because the product of all terms but the power of 1000 can be
! calculated as an integer, the terms in the series can be separated into
! a large integer term:
! 
!     
! 
!          (2⁵) (6n)! (532n² + 126n + 9) / (3(n!)⁶) (***)
! 
! multiplied by a negative integer power of 10:
! 
!     
! 
!          10^(-(6n + 3))
! 
! Task:
! 
! -   -   Print the integer portions (the starred formula, which is
!         without the power of 1000 divisor) of the first 10 terms of the
!         series.
!     -   Use the complete formula to calculate and print π to 70 decimal
!         digits of precision.
! 
! Reference:
! 
! -   -   Gert Almkvist and Jesús Guillera, Ramanujan-like series for 1/π²
!         and string theory, Experimental Mathematics, 21 (2012), page 2,
!         formula 1.

USING: continuations formatting io kernel locals math
math.factorials math.functions sequences ;

:: integer-term ( n -- m )
    32 6 n * factorial * 532 n sq * 126 n * + 9 + *
    n factorial 6 ^ 3 * / ;

: exponent-term ( n -- m ) 6 * 3 + neg ;

: nth-term ( n -- x )
    [ integer-term ] [ exponent-term 10^ * ] bi ;

! Factor doesn't have an arbitrary-precision square root afaik,
! so make one using Heron's method.

: sqrt-approx ( r x -- r' x ) [ over / + 2 / ] keep ;

:: almkvist-guillera ( precision -- x )
    0 0 :> ( summed! next-add! )
    [
        100,000,000 <iota> [| n |
            summed n nth-term + next-add!
            next-add summed - abs precision neg 10^ <
            [ return ] when
            next-add summed!
        ] each
    ] with-return
    next-add ;

CONSTANT: 1/pi 113/355  ! Use as initial guess for square root approximation

: pi ( -- )
    1/pi 70 almkvist-guillera 5 [ sqrt-approx ] times
    drop recip "%.70f\n" printf ;

! Task
"N                               Integer Portion  Pow  Nth Term (33 dp)" print
89 CHAR: - <repetition> print
10 [
    dup [ integer-term ] [ exponent-term ] [ nth-term ] tri
    "%d  %44d  %3d  %.33f\n" printf
] each-integer nl
"Pi to 70 decimal places:" print pi
