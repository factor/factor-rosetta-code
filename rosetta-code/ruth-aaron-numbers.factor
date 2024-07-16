! A Ruth–Aaron pair consists of two consecutive integers (e.g., 714 and
! 715) for which the sums of the prime divisors of each integer are equal.
! So called because 714 is Babe Ruth's lifetime home run record; Hank
! Aaron's 715th home run broke this record and 714 and 715 have the same
! prime divisor sum.
! 
! A Ruth–Aaron triple consists of three consecutive integers with the same
! properties.
! 
! There is a second variant of Ruth–Aaron numbers, one which uses prime
! factors rather than prime divisors. The difference; divisors are unique,
! factors may be repeated. The 714, 715 pair appears in both, so the name
! still fits.
! 
! It is common to refer to each Ruth–Aaron group by the first number in
! it.
! 
! Task
! 
! -   Find and show, here on this page, the first 30 Ruth-Aaron numbers
!     (factors).
! 
! -   Find and show, here on this page, the first 30 Ruth-Aaron numbers
!     (divisors).
! 
! Stretch
! 
! -   Find and show the first Ruth-Aaron triple (factors).
! 
! -   Find and show the first Ruth-Aaron triple (divisors).
! 
! See also
! 
! *Wikipedia: Ruth–Aaron pair
! *OEIS:A006145 - Ruth-Aaron numbers (1): sum of prime divisors of n = sum of prime divisors of n+1
! *OEIS:A039752 - Ruth-Aaron numbers (2): sum of prime divisors of n = sum of prime divisors of n+1 (both taken with multiplicity)

USING: assocs.extras grouping io kernel lists lists.lazy math
math.primes.factors prettyprint ranges sequences ;

: pair-same? ( ... n quot: ( ... m -- ... n ) -- ... ? )
    [ dup 1 + ] dip same? ; inline

: RA-f? ( n -- ? ) [ factors sum ] pair-same? ;
: RA-d? ( n -- ? ) [ group-factors sum-keys ] pair-same? ;
: filter-naturals ( quot -- list ) 1 lfrom swap lfilter ; inline
: RA-f ( -- list ) [ RA-f? ] filter-naturals ;
: RA-d ( -- list ) [ RA-d? ] filter-naturals ;

: list. ( list -- )
    30 swap ltake list>array 10 group simple-table. ;

"First 30 Ruth-Aaron numbers (factors):" print
RA-f list. nl

"First 30 Ruth-Aaron numbers (divisors):" print
RA-d list.
