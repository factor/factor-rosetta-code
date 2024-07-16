! A positive integer is a Kaprekar number if:
! 
! -   It is 1 (unity)
! -   The decimal representation of its square may be split once into two
!     parts consisting of positive integers which sum to the original
!     number.
! 
! Note that a split resulting in a part consisting purely of 0s is not
! valid, as 0 is not considered positive.
! 
! Example Kaprekar numbers:
! 
! -   2223 is a Kaprekar number, as 2223 * 2223 = 4941729, 4941729 may be
!     split to 494 and 1729, and 494 + 1729 = 2223.
! -   The series of Kaprekar numbers is known as A006886, and begins as
!     1, 9, 45, 55, ....
! 
! Example process:
! 
! 10000 (100²) splitting from left to right:
! 
! -   The first split is [1, 0000], and is invalid; the 0000 element
!     consists entirely of 0s, and 0 is not considered positive.
! -   Slight optimization opportunity: When splitting from left to right,
!     once the right part consists entirely of 0s, no further testing is
!     needed; all further splits would also be invalid.
! 
! Task:
! 
! Generate and show all Kaprekar numbers less than 10,000.
! 
! Extra credit:
! 
! Optionally, count (and report the count of) how many Kaprekar numbers
! are less than 1,000,000.
! 
! Extra extra credit:
! 
! The concept of Kaprekar numbers is not limited to base 10 (i.e. decimal
! numbers); if you can, show that Kaprekar numbers exist in other bases
! too.
! 
! For this purpose, do the following:
! 
! -   Find all Kaprekar numbers for base 17 between 1 and 1,000,000 (one
!     million);
! -   Display each of them in base 10 representation;
! -   Optionally, using base 17 representation (use letters 'a' to 'g' for
!     digits 10(10) to 16(10)), display each of the numbers, its square,
!     and where to split the square.
! 
! For example, 225(10) is "d4" in base 17, its square "a52g", and a5(17) +
! 2g(17) = d4(17), so the display would be something like:
! 
!     225   d4  a52g  a5 + 2g
! 
! Reference:
! 
! -   The Kaprekar Numbers by Douglas E. Iannucci (2000). PDF version
! 
! Related task:
! 
! -   Casting out nines

USING: io kernel lists lists.lazy locals math math.functions
math.ranges prettyprint sequences ;

:: kaprekar? ( n -- ? )
    n sq :> sqr
    1 lfrom
    [ 10 swap ^ ] lmap-lazy
    [ n > ] lfilter
    [ sqr swap mod n < ] lwhile
    list>array
    [ 1 - sqr n - swap mod zero? ] any?
    n 1 = or ;

1,000,000 [1,b] [ kaprekar? ] filter dup . length
"Count of Kaprekar numbers <= 1,000,000: " write .
