! A positive integer n is said to be a Rhonda number to base b if the
! product of the base b digits of n is equal to b'' times the sum ofn'''s
! prime factors.
! 
! These numbers were named by Kevin Brown after an acquaintance of his
! whose residence number was 25662, a member of the base 10 numbers with
! this property.
! 
! 25662 is a Rhonda number to base-10. The prime factorization is 2 × 3 ×
! 7 × 13 × 47; the product of its base-10 digits is equal to the base
! times the sum of its prime factors:
! 
! 2 × 5 × 6 × 6 × 2 = 720 = 10 × (2 + 3 + 7 + 13 + 47)
! 
! Rhonda numbers only exist in bases that are not a prime.
! 
! Rhonda numbers to base 10 always contain at least 1 digit 5 and always
! contain at least 1 even digit.
! 
! Task
! 
! -   For the non-prime bases b from 2 through 16 , find and display here,
!     on this page, at least the first 10 Rhonda numbers to base b.
!     Display the found numbers at least in base 10.
! 
! Stretch
! 
! -   Extend out to base 36.
! 
! See also
! 
! * Wolfram Mathworld - Rhonda numbers
! * Numbers Aplenty - Rhonda numbers
! * OEIS:A100968 - Integers n that are Rhonda numbers to base 4
! * OEIS:A100969 - Integers n that are Rhonda numbers to base 6
! * OEIS:A100970 - Integers n that are Rhonda numbers to base 8
! * OEIS:A100973 - Integers n that are Rhonda numbers to base 9
! * OEIS:A099542 - Rhonda numbers to base 10
! * OEIS:A100971 - Integers n that are Rhonda numbers to base 12
! * OEIS:A100972 - Integers n that are Rhonda numbers to base 14
! * OEIS:A100974 - Integers n that are Rhonda numbers to base 15
! * OEIS:A100975 - Integers n that are Rhonda numbers to base 16
! 
! * OEIS:A255735 - Integers n that are Rhonda numbers to base 18
! * OEIS:A255732 - Rhonda numbers in vigesimal number system (base 20)
! * OEIS:A255736 - Integers that are Rhonda numbers to base 30
! 
! * Related Task: Smith numbers

USING: formatting grouping io kernel lists lists.lazy math
math.parser math.primes math.primes.factors prettyprint ranges
sequences sequences.extras ;

: rhonda? ( n base -- ? )
    [ [ >base 1 group ] keep '[ _ base> ] map-product ]
    [ swap factors sum * ] 2bi = ;

: rhonda ( base -- list ) 1 lfrom swap '[ _ rhonda? ] lfilter ;

: list. ( list base -- ) '[ _ >base write bl ] leach nl ;

:: rhonda. ( base -- )
    15 base rhonda ltake :> r
    base "First 15 Rhonda numbers to base %d:\n" printf
    "In base 10: " write r 10 list.
    base "In base %d: " printf r base list. ;

2 36 [a..b] [ prime? not ] filter [ rhonda. nl ] each
