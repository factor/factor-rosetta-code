! In mathematics, the n-th harmonic number is the sum of the reciprocals
! of the first n natural numbers:
! 
!    H_(n) = 1 + 1/2 + 1/3 + ... + 1/n
! 
! The series of harmonic numbers thus obtained is often loosely referred
! to as the harmonic series.
! 
! Harmonic numbers are closely related to the Riemann zeta function, and
! roughly approximate the natural logarithm function; differing by γ
! (lowercase Gamma), the Euler–Mascheroni constant.
! 
! The harmonic series is divergent, albeit quite slowly, and grows toward
! infinity.
! 
! Task
! 
! -   Write a function (routine, procedure, whatever it may be called in
!     your language) to generate harmonic numbers.
! -   Use that procedure to show the values of the first 20 harmonic
!     numbers.
! -   Find and show the position in the series of the first value greater
!     than the integers 1 through 5
! 
! Stretch
! 
! -   Find and show the position in the series of the first value greater
!     than the integers 6 through 10
! 
! Related
! 
! -   Egyptian fractions

USING: formatting grouping io kernel lists lists.lazy math
math.functions math.ranges math.statistics math.text.english
prettyprint sequences tools.memory.private ;

! Euler-Mascheroni constant
CONSTANT: γ 0.5772156649

: Hn-approx ( n -- ~Hn )
    [ log γ + 1 2 ] [ * /f + 1 ] [ sq 12 * /f - ] tri ;

: lharmonics ( -- list ) 1 lfrom [ Hn-approx ] lmap-lazy ;

: first-gt ( m -- n ) lharmonics swap '[ _ < ] lwhile llength ;

"First twenty harmonic numbers as mixed numbers:" print
100 [1,b] [ recip ] map cum-sum
[ 20 head 5 group simple-table. nl ]
[ "One hundredth:" print last . nl ] bi

"(zero based) Index of first value:" print
10 [1,b] [
    dup first-gt [ commas ] [ 1 + number>text ] bi
    "  greater than %2d: %6s (term number %s)\n" printf
] each
