! Example
! 
! Consider the number 24. Its proper divisors are: 1, 2, 3, 4, 6, 8 and
! 12. Their product is 13,824 and the cube root of this is 24. So 24
! satisfies the definition in the task title.
! 
! Task
! 
! Compute and show here the first 50 positive integers which are the cube
! roots of the product of their proper divisors.
! 
! Also show the 500th and 5,000th such numbers.
! 
! Stretch
! 
! Compute and show the 50,000th such number.
! 
! Reference
! 
! -   OEIS:A111398 - Numbers which are the cube roots of the product of
!     their proper divisors.
! 
! Note
! 
! OEIS considers 1 to be the first number in this sequence even though,
! strictly speaking, it has no proper divisors. Please therefore do
! likewise.

USING: formatting grouping io kernel lists lists.lazy math
prettyprint project-euler.common ;

: A111398 ( -- list )
    L{ 1 } 2 lfrom [ tau 8 = ] lfilter lappend-lazy ;

50 A111398 ltake list>array 10 group simple-table. nl
499 4999 49999
[ [ 1 + ] keep A111398 lnth "%5dth: %d\n" printf ] tri@
