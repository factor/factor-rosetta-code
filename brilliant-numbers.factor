! Brilliant numbers are a subset of semiprime numbers. Specifically, they
! are numbers that are the product of exactly two prime numbers that both
! have the same number of digits when expressed in base 10.
! 
! Brilliant numbers are useful in cryptography and when testing prime
! factoring algorithms.
! 
! E.G.
! 
! -   3 × 3 (9) is a brilliant number.
! -   2 × 7 (14) is a brilliant number.
! -   113 × 691 (78083) is a brilliant number.
! -   2 × 31 (62) is semiprime, but is not a brilliant number (different
!     number of digits in the two factors).
! 
! Task
! 
! -   Find and display the first 100 brilliant numbers.
! -   For the orders of magnitude 1 through 6, find and show the first
!     brilliant number greater than or equal to the order of magnitude,
!     and, its position in the series (or the count of brilliant numbers
!     up to that point).
! 
! Stretch
! 
! -   Continue for larger orders of magnitude.
! 
! See also
! * Numbers Aplenty - Brilliant numbers
! * OEIS:A078972 - Brilliant numbers: semiprimes whose prime factors have the same number of decimal digits

USING: assocs formatting grouping io kernel lists lists.lazy
math math.functions math.primes.factors prettyprint
project-euler.common sequences ;

MEMO: brilliant? ( n -- ? )
    factors [ length 2 = ] keep
    [ number-length ] map all-eq? and ;

: lbrilliant ( -- list )
    2 lfrom [ brilliant? ] lfilter 1 lfrom lzip ;

: first> ( m -- n )
    lbrilliant swap '[ first _ >= ] lfilter car ;

: .first> ( n -- )
    dup first> first2
    "First brilliant number >= %7d: %7d at position %5d\n"
    printf ;

100 lbrilliant ltake list>array keys 10 group simple-table. nl
{ 1 2 3 4 5 6 } [ 10^ .first> ] each
