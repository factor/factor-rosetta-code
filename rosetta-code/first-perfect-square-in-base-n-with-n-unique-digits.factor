! Find the first perfect square in a given base N that has at least N
! digits and exactly N significant unique digits when expressed in base N.
! 
! E.G. In base 10, the first perfect square with at least 10 unique digits
! is 1026753849 (32043²).
! 
! You may use analytical methods to reduce the search space, but the code
! must do a search. Do not use magic numbers or just feed the code the
! answer to verify it is correct.
! 
! Task
! 
! -   Find and display here, on this page, the first perfect square in
!     base N, with N significant unique digits when expressed in base N,
!     for each of base 2 through 12. Display each number in the base N for
!     which it was calculated.
! 
! -   (optional) Do the same for bases 13 through 16.
! 
! -   (stretch goal) Continue on for bases 17 - ?? (Big Integer math)
! 
! See also:
! 
! * OEIS A260182: smallest square that is pandigital in base n.
! 
! Related task
! 
! * Casting out nines

USING: assocs formatting fry kernel math math.functions
math.parser math.ranges math.statistics sequences ;
IN: rosetta-code.A260182

: pandigital? ( n base -- ? )
    [ >base histogram assoc-size ] keep >= ;

! Return the smallest decimal integer square root whose squared
! digit length in base n is at least n.
: search-start ( base -- n ) dup 1 - ^ sqrt ceiling >integer ;

: find-root ( base -- n )
    [ search-start ] [ ] bi
    '[ dup sq _ pandigital? ] [ 1 + ] until ;

: show-base ( base -- )
    dup find-root dup sq pick [ >base ] curry bi@
    "Base %2d: %8s squared = %s\n" printf ;

: main ( -- ) 2 16 [a,b] [ show-base ] each ;

MAIN: main
