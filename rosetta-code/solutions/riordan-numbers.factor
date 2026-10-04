! Riordan numbers show up in several places in set theory. They are
! closely related to Motzkin numbers, and may be used to derive them.
! 
! Riordan numbers comprise the sequence a where:
! 
!    a(0) = 1, a(1) = 0, for subsequent terms, a(n) = (n-1)*(2*a(n-1) + 3*a(n-2))/(n+1)
! 
! There are other generating functions, and you are free to use one most
! convenient for your language.
! 
! Task
! 
! - Find and display the first 32 Riordan numbers.
! 
! Stretch
! 
! - Find and display the digit count of the 1,000th Riordan number.
! - Find and display the digit count of the 10,000th Riordan number.
! 
! See also
! * OEIS:A005043 - Riordan numbers

USING: combinators grouping interpolate io kernel math
math.parser prettyprint sequences tools.memory.private ;
IN: rosetta-code.riordan-numbers

MEMO: riordan ( m -- n )
    {
        { 0 [ 1 ] }
        { 1 [ 0 ] }
        [
            {
                [ 1 - riordan 2 * ]
                [ 2 - riordan 3 * + ]
                [ 1 - * ]
                [ 1 + / ]
            } cleave
        ]
    } case ;

MAIN: [
    "First 32 Riordan numbers:" print
    32 [ riordan commas ] map-integers 4 group simple-table. nl
    9,999 999 [ riordan >dec length ] bi@
    [I 1,000th: ${} digitsI] nl
    [I 10,000th: ${} digitsI] nl
]
