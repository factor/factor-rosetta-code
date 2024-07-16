! Task:
! 
! Print out the first 15 Catalan numbers by extracting them from Pascal's
! triangle.
! 
! See:
! 
! -   Catalan Numbers and the Pascal Triangle. This method enables
!     calculation of Catalan Numbers using only addition and subtraction.
! 
! -   Catalan's Triangle for a Number Triangle that generates Catalan
!     Numbers using only addition.
! -   Sequence A000108 on OEIS has a lot of information on Catalan
!     Numbers.
! 
! Related Tasks:
! 
! Pascal's triangle

USING: arrays grouping io kernel math prettyprint sequences ;
IN: rosetta-code.catalan-pascal

: next-row ( seq -- seq' )
    2 clump [ sum ] map 1 prefix 1 suffix ;
    
: pascal ( n -- seq )
    1 - { { 1 } } swap [ dup last next-row suffix ] times ;

15 2 * pascal [ length odd? ] filter [
    dup length 1 = [ 1 ]
    [ dup midpoint@ dup 1 + 2array swap nths first2 - ] if
    pprint bl
] each drop
