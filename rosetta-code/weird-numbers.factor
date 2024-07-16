! In number theory, a weird number is a natural number that is abundant
! but not semiperfect (and therefore not perfect either).
! 
! In other words, the sum of the proper divisors of the number (divisors
! including 1 but not itself) is greater than the number itself (the
! number is abundant), but no subset of those divisors sums to the number
! itself (the number is not semiperfect).
! 
! For example:
! 
! -   12 is not a weird number.
!     -   It is abundant; its proper divisors 1, 2, 3, 4, 6 sum to 16
!         (which is > 12),
!     -   but it is semiperfect, e.g.: 6 + 4 + 2 == 12.
! -   70 is a weird number.
!     -   It is abundant; its proper divisors 1, 2, 5, 7, 10, 14, 35 sum
!         to 74 (which is > 70),
!     -   and there is no subset of proper divisors that sum to 70.
! 
! Task:
! 
! Find and display, here on this page, the first 25 weird numbers.
! 
! Related tasks:
! 
! -   -   Abundant, deficient and perfect number classifications
!     -   Proper divisors
! 
! See also:
! 
! -   -   OEIS: A006037 weird numbers
!     -   Wikipedia: weird number
!     -   MathWorld: weird number

USING: combinators.short-circuit io kernel lists lists.lazy
locals math math.primes.factors prettyprint sequences ;
IN: rosetta-code.weird-numbers

:: has-sum? ( n seq -- ? )
    seq [ f ] [
        unclip-slice :> ( xs x )
        n x < [ n xs has-sum? ] [
            {
                [ n x = ]
                [ n x - xs has-sum? ]
                [ n xs has-sum? ]
            } 0||
        ] if
    ] if-empty ;

: weird? ( n -- ? )
    dup divisors but-last reverse
    { [ sum < ] [ has-sum? not ] } 2&& ;

: weirds ( -- list ) 1 lfrom [ weird? ] lfilter ;

: weird-numbers-demo ( -- )
    "First 25 weird numbers:" print
    25 weirds ltake list>array . ;

MAIN: weird-numbers-demo
