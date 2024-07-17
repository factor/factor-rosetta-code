! Task:
! 
! Produce a zig-zag array.
! 
! A zig-zag array is a square arrangement of the first N² natural numbers,
! where the
! 
! numbers increase sequentially as you zig-zag along the array's
! anti-diagonals.
! 
! For a graphical representation, see JPG zigzag (JPG uses such arrays to
! encode images).
! 
! For example, given 5, produce this array:
! 
!      0  1  5  6 14
!      2  4  7 13 15
!      3  8 12 16 21
!      9 11 17 20 22
!     10 18 19 23 24
! 
! Related tasks:
! 
! -   Spiral matrix
! -   Identity matrix
! -   Ulam spiral (for primes)
! 
! See also:
! 
! -   Wiktionary entry: anti-diagonals

USING: columns fry kernel make math math.ranges prettyprint
sequences sequences.cords sequences.extras ;
IN: rosetta-code.zig-zag-matrix

: [1,b,1] ( n -- seq )
    [1,b] dup but-last-slice <reversed> cord-append ;

: <reversed-evens> ( seq -- seq' )
    [ even? [ <reversed> ] when ] map-index ;

: diagonals ( n -- seq )
    [ sq <iota> ] [ [1,b,1] ] bi
    [ [ cut [ , ] dip ] each ] { } make nip <reversed-evens> ;

: zig-zag-matrix ( n -- seq )
    [ diagonals ] [ dup ] bi '[
        [
            dup 0 <column> _ head ,
            [ _ < [ rest-slice ] when ] map-index harvest
        ] until-empty
    ] { } make ;

: zig-zag-demo ( -- ) 5 zig-zag-matrix simple-table. ;

MAIN: zig-zag-demo
