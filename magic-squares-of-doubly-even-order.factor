! A magic square is an N×N  square matrix whose numbers consist of
! consecutive numbers arranged so that the sum of each row and column, and
! both diagonals are equal to the same sum (which is called the magic
! number or magic constant).
! 
! A magic square of doubly even order has a size that is a multiple of
! four (e.g. 4, 8, 12).
! 
! This means that the subsquares also have an even size, which plays a
! role in the construction.
! 
!   ---- ---- ---- ---- ---- ---- ---- ----
!   1    2    62   61   60   59   7    8
!   9    10   54   53   52   51   15   16
!   48   47   19   20   21   22   42   41
!   40   39   27   28   29   30   34   33
!   32   31   35   36   37   38   26   25
!   24   23   43   44   45   46   18   17
!   49   50   14   13   12   11   55   56
!   57   58   6    5    4    3    63   64
!   ---- ---- ---- ---- ---- ---- ---- ----
! 
! Task
! 
! Create a magic square of 8 × 8.
! 
! Related tasks
! 
! -   Magic squares of odd order
! -   Magic squares of singly even order
! 
! See also:
! 
! -   Doubly Even Magic Squares (1728.org)

USING: arrays combinators.short-circuit formatting fry
generalizations kernel math math.matrices prettyprint sequences
;
IN: rosetta-code.doubly-even-magic-squares

: top?    ( loc n -- ? ) [ second ] dip 1/4 * <  ;
: bottom? ( loc n -- ? ) [ second ] dip 3/4 * >= ;
: left?   ( loc n -- ? ) [ first  ] dip 1/4 * <  ;
: right?  ( loc n -- ? ) [ first  ] dip 3/4 * >= ;
: corner? ( loc n -- ? )
    {
        [ { [ top?    ] [ left?  ] } ]
        [ { [ top?    ] [ right? ] } ]
        [ { [ bottom? ] [ left?  ] } ]
        [ { [ bottom? ] [ right? ] } ]
    } [ 2&& ] map-compose 2|| ;

: center? ( loc n -- ? )
    { [ top? ] [ bottom? ] [ left? ] [ right? ] } [ not ]
    map-compose 2&& ;

: backward? ( loc n -- ? ) { [ corner? ] [ center? ] } 2|| ;
: forward   ( loc n -- m ) [ first2 ] dip * 1 + + ;
: backward  ( loc n -- m ) tuck forward [ sq ] dip - 1 + ;

: (doubly-even-magic-square) ( n -- matrix )
    [ dup 2array matrix-coordinates flip ] [ 3 dupn ] bi
    '[ dup _ backward? [ _ backward ] [ _ forward ] if ]
    matrix-map ;

ERROR: invalid-order order ;

: check-order ( n -- )
    dup { [ zero? not ] [ 4 mod zero? ] } 1&& [ drop ]
    [ invalid-order ] if ;

: doubly-even-magic-square ( n -- matrix )
    dup check-order (doubly-even-magic-square) ;

: main ( -- )
    { 4 8 12 } [
        dup doubly-even-magic-square dup
        [ "Order: %d\n" printf ]
        [ simple-table. ]
        [ first sum "Magic constant: %d\n\n" printf ] tri*
    ] each ;

MAIN: main
