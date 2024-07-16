! Task:
! 
! Get two integers from the user, and then (for those two integers),
! display their:
! 
! -   -   sum
!     -   difference
!     -   product
!     -   integer quotient
!     -   remainder
!     -   exponentiation (if the operator exists)
! 
! Don't include error handling.
! 
! For quotient, indicate how it rounds (e.g. towards zero, towards
! negative infinity, etc.).
! 
! For remainder, indicate whether its sign matches the sign of the first
! operand or of the second operand, if they are different.
! 
! Bonus: Include an example of the integer `divmod` operator. For example:
! as in #Haskell, #Python and #ALGOL 68

USING: combinators io kernel math math.functions math.order
math.parser prettyprint ;

"a=" "b=" [ write readln string>number ] bi@
{
    [ + "sum: " write . ]
    [ - "difference: " write . ] 
    [ * "product: " write . ]
    [ / "quotient: " write . ]
    [ /i "integer quotient: " write . ]
    [ rem "remainder: " write . ]
    [ mod "modulo: " write . ]
    [ max "maximum: " write . ]
    [ min "minimum: " write . ]
    [ gcd "gcd: " write . drop ]
    [ lcm "lcm: " write . ]
} 2cleave
