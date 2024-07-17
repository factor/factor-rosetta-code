! Numbers (positive integers expressed in base ten) that are (evenly)
! divisible by the number formed by the first and last digit are known as
! gapful numbers.
! 
! Evenly divisible means divisible with no remainder.
! 
! All one─ and two─digit numbers have this property and are trivially
! excluded. Only numbers ≥ 100 will be considered for this Rosetta Code
! task.
! 
! Example:
! 
! 187 is a gapful number because it is evenly divisible by the number 17
! which is formed by the first and last decimal digits of 187.
! 
! About 7.46% of positive integers are gapful.
! 
! Task:
! 
! -   -   Generate and show all sets of numbers (below) on one line
!         (horizontally) with a title, here on this page
!     -   Show the first 30 gapful numbers
!     -   Show the first 15 gapful numbers ≥ 1,000,000
!     -   Show the first 10 gapful numbers ≥ 1,000,000,000
! 
! Related tasks:
! 
! -   -   Harshad or Niven series.
!     -   palindromic gapful numbers.
!     -   largest number divisible by its digits.
! 
! Also see:
! 
! -   -   The OEIS entry: A108343 gapful numbers.
!     -   numbersaplenty gapful numbers

USING: formatting kernel lists lists.lazy math math.functions
math.text.utils sequences ;

: gapful? ( n -- ? )
    dup 1 digit-groups [ first ] [ last 10 * + ] bi divisor? ;

30 100 15 1,000,000 10 1,000,000,000 [
    2dup lfrom [ gapful? ] lfilter ltake list>array
    "%d gapful numbers starting at %d:\n%[%d, %]\n\n" printf
] 2tri@
