! Negative base numbers are an alternate way to encode numbers without the
! need for a minus sign. Various negative bases may be used including
! negadecimal (base -10), negabinary (-2) and negaternary (-3).[1][2]
! 
! Task:
! 
! -   Encode the decimal number 10 as negabinary (expect 11110)
! -   Encode the decimal number 146 as negaternary (expect 21102)
! -   Encode the decimal number 15 as negadecimal (expect 195)
! -   In each of the above cases, convert the encoded number back to
!     decimal.
! 
! extra credit:
! 
! -   supply an integer, that when encoded to base -62 (or something
!     "higher"), expresses the
! 
! name of the language being used (with correct capitalization). If the
! computer language has non-alphanumeric characters, try to encode them
! into the negatory numerals, or use other characters instead.
! 
! [1] Negabinary on Wolfram Mathworld
! 
! [2] Negative base on Wikipedia

USING: formatting fry kernel make math math.combinators
math.extras math.functions math.parser sequences ;

: /mod* ( x y -- z w )
    [ /mod ] keep '[ [ 1 + ] dip _ abs + ] when-negative ;

: >nega ( n radix -- str )
    [ '[ _ /mod* # ] until-zero ] "" make reverse ;

: nega> ( str radix -- n )
    swap <reversed> [ ^ swap digit> * ] with map-index sum ;

: .round-trip ( n radix -- )
    dupd [ >nega ] keep 2dup 2dup nega>
    "%d_10 is %s_%d\n%s_%d is %d_10\n\n" printf ;

10 -2 146 -3 15 -10 [ .round-trip ] 2tri@
