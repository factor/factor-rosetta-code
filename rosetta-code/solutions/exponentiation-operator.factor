! Most programming languages have a built-in implementation of
! exponentiation.
! 
! Task:
! 
! Re-implement integer exponentiation for both int^(int) and float^(int)
! as both a procedure, and an operator (if your language supports operator
! definition).
! 
! If the language supports operator (or procedure) overloading, then an
! overloaded form should be provided for both int^(int) and float^(int)
! variants.
! 
! Related tasks:
! 
! -   Exponentiation order
! -   arbitrary-precision integers (included)
! -   Exponentiation with infix operators in (or operating on) the base
! 
! Category:Arithmetic

: pow ( f n -- f' )
    dup 0 < [ abs pow recip ]
    [ [ 1 ] 2dip swap [ * ] curry times ] if ;

: pow ( f n -- f' )
    {  
        { [ dup 0 < ] [ abs pow recip ] }
        { [ dup 0 = ] [ 2drop 1 ] }
        [ [ 2 mod 1 = swap 1 ? ] [ [ sq ] [ 2 /i ] bi* pow ] 2bi * ]
    } cond ;

USING: combinators kernel math ;
IN: test

: (pow) ( f n -- f' )
    [ dup even? ] [ [ sq ] [ 2 /i ] bi* ] while
    dup 1 = [ drop ] [ dupd 1 - (pow) * ] if ;

: pow ( f n -- f' )
    {
        { [ dup 0 < ] [ abs (pow) recip ] }
        { [ dup 0 = ] [ 2drop 1 ] }
        [ (pow) ]
    } cond ;

: (pow) ( f n -- f' )
    [ 1 ] 2dip     
    [ dup 1 = ] [
        dup even? [ [ sq ] [ 2 /i ] bi* ] [ [ [ * ] keep ] dip 1 - ] if
    ] until
    drop * ;
