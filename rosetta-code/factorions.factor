! Definition:
! 
! A factorion is a natural number that equals the sum of the factorials of
! its digits.
! 
! Example:
! 
! 145 is a factorion in base 10 because:
! 
!           1! + 4! + 5!   =   1 + 24 + 120   =   145 
! 
! It can be shown (see talk page) that no factorion in base 10 can exceed
! 1,499,999.
! 
! Task:
! 
! Write a program in your language to demonstrate, by calculating and
! printing out the factorions, that:
! 
! -   -   There are 3 factorions in base 9
!     -   There are 4 factorions in base 10
!     -   There are 5 factorions in base 11
!     -   There are 2 factorions in base 12 (up to the same upper bound as
!         for base 10)
! 
! See also:
! 
! -   -   Wikipedia article
!     -   OEIS:A014080 - Factorions in base 10
!     -   OEIS:A193163 - Factorions in base n

USING: formatting io kernel math math.parser math.ranges memoize
prettyprint sequences ;
IN: rosetta-code.factorions

! Memoize factorial function
MEMO: factorial ( n -- n! ) [ 1 ] [ [1,b] product ] if-zero ;

: factorion? ( n base -- ? )
    dupd >base string>digits [ factorial ] map-sum = ;

: show-factorions ( limit base -- )
    dup "The factorions for base %d are:\n" printf
    [ [1,b) ] dip [ dupd factorion? [ pprint bl ] [ drop ] if ]
    curry each nl ;

1,500,000 9 12 [a,b] [ show-factorions nl ] with each
