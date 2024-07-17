! Most programmers are familiar with the inexactness of floating point
! calculations in a binary processor.
! 
! The classic example being:
! 
!     0.1 + 0.2 =  0.30000000000000004
! 
! In many situations the amount of error in such calculations is very
! small and can be overlooked or eliminated with rounding.
! 
! There are pathological problems however, where seemingly simple,
! straight-forward calculations are extremely sensitive to even tiny
! amounts of imprecision.
! 
! This task's purpose is to show how your language deals with such classes
! of problems.
! 
! A sequence that seems to converge to a wrong limit.
! 
! Consider the sequence:
! 
!     
! 
!          v₁ = 2
!          v₂ = -4
!          v_(n) = 111 - 1130 / v_(n-1) + 3000 / (v_(n-1) * v_(n-2))
! 
! As n grows larger, the series should converge to 6 but small amounts of
! error will cause it to approach 100.
! 
! Task 1:
! 
! Display the values of the sequence where n = 3, 4, 5, 6, 7, 8, 20, 30,
! 50 & 100 to at least 16 decimal places.
! 
!         n = 3     18.5
!         n = 4      9.378378
!         n = 5      7.801153
!         n = 6      7.154414
!         n = 7      6.806785
!         n = 8      6.5926328
!         n = 20     6.0435521101892689
!         n = 30     6.006786093031205758530554
!         n = 50     6.0001758466271871889456140207471954695237
!         n = 100    6.000000019319477929104086803403585715024350675436952458072592750856521767230266
! 
! Task 2:
! 
! The Chaotic Bank Society is offering a new investment account to their
! customers.
! 
! You first deposit $e - 1 where e is 2.7182818... the base of natural
! logarithms.
! 
! After each year, your account balance will be multiplied by the number
! of years that have passed, and $1 in service charges will be removed.
! 
! So ...
! 
! -   -   after 1 year, your balance will be multiplied by 1 and $1 will
!         be removed for service charges.
!     -   after 2 years your balance will be doubled and $1 removed.
!     -   after 3 years your balance will be tripled and $1 removed.
!     -    ...
!     -   after 10 years, multiplied by 10 and $1 removed, and so on.
! 
! What will your balance be after 25 years?
! 
!    Starting balance: $e-1
!    Balance = (Balance * year) - 1 for 25 years
!    Balance after 25 years: $0.0399387296732302
! 
! Task 3, extra credit:
! 
! Siegfried Rump's example. Consider the following function, designed by
! Siegfried Rump in 1988.
! 
!     
! 
!          f(a,b) = 333.75b⁶ + a²( 11a²b² - b⁶ - 121b⁴ - 2 ) + 5.5b⁸ +
!         a/(2b)
!          compute f(a,b) where a=77617.0 and b=33096.0
!          f(77617.0, 33096.0) = -0.827396059946821
! 
! Demonstrate how to solve at least one of the first two problems, or
! both, and the third if you're feeling particularly jaunty.
! 
! See also;
! 
! -   Floating-Point Arithmetic Section 1.3.2 Difficult problems.

USING: formatting fry io kernel locals math math.functions
math.ranges sequences ;
IN: rosetta-code.pathological

: next2 ( x y -- y z )
    swap dupd dupd '[ 111 1130 _ / - 3000 _ _ * / + ] call ;

: pathological-sequence ( -- seq )
    2 -4 100 [ next2 dup ] replicate 2nip { 0 2 -4 } prepend ;

: show-sequence ( -- )
    { 3 4 5 6 7 8 20 30 50 100 } dup pathological-sequence nths
    [ "n = %-3d %21.16f\n" printf ] 2each ;

CONSTANT: e 106246577894593683/39085931702241241
: balance ( n -- x ) [1,b] e 1 - [ * 1 - ] reduce ;

:: f ( a b -- x )
    333+3/4 b 6 ^ * 11 a sq b sq * * b 6 ^ - b 4 ^ 121 * - 2 - a
    sq * b 8 ^ 5+1/2 * a 2 b * / + + + ;

: pathological-demo ( -- )
    "Task 1 - Sequence convergence:" print show-sequence nl

    "Task 2 - Chaotic Bank fund after 25 years:" print
    25 balance "%.16f\n" printf nl

    "Task 3 - Siegfried Rump's example:" print
    77617 33096 f "77617 33096 f = %.16f\n" printf ;

MAIN: pathological-demo
