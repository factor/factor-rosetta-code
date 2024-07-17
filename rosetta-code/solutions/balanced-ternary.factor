! Balanced ternary is a way of representing numbers. Unlike the prevailing
! binary representation, a balanced ternary integer is in base 3, and each
! digit can have the values 1, 0, or −1.
! 
! Examples:
! 
! Decimal 11 = 3² + 3¹ − 3⁰, thus it can be written as "++−"
! 
! Decimal 6 = 3² − 3¹ + 0 × 3⁰, thus it can be written as "+−0"
! 
! Task:
! 
! Implement balanced ternary representation of integers with the
! following:
! 
! 1.  Support arbitrarily large integers, both positive and negative;
! 2.  Provide ways to convert to and from text strings, using digits '+',
!     '-' and '0' (unless you are already using strings to represent
!     balanced ternary; but see requirement 5).
! 3.  Provide ways to convert to and from native integer type (unless,
!     improbably, your platform's native integer type is balanced
!     ternary). If your native integers can't support arbitrary length,
!     overflows during conversion must be indicated.
! 4.  Provide ways to perform addition, negation and multiplication
!     directly on balanced ternary integers; do not convert to native
!     integers first.
! 5.  Make your implementation efficient, with a reasonable definition of
!     "efficient" (and with a reasonable definition of "reasonable").
! 
! Test case With balanced ternaries a from string "+-0++0+", b from native
! integer -436, c "+-++-":
! 
! -   write out a, b and c in decimal notation;
! -   calculate a × (b − c), write out the result in both ternary and
!     decimal notations.
! 
! Note: The pages generalised floating point addition and generalised
! floating point multiplication have code implementing arbitrary precision
! floating point balanced ternary.

USING: kernel combinators locals formatting lint literals
       sequences assocs strings arrays
       math math.functions math.order ;
IN: rosetta-code.bt
CONSTANT: addlookup {
  { 0 CHAR: 0 }
  { 1 CHAR: + }
  { -1 CHAR: - }
}

<PRIVATE

: bt-add-digits ( a b c -- d e ) 
  + + 3 +
  { { 0 -1 } { 1 -1 } { -1 0 } { 0 0 } { 1 0 } { -1 1 } { 0 1 } } 
  nth first2
;

PRIVATE>

! Conversion
: bt>integer ( seq -- x ) 0 [ swap 3 * + ] reduce ;
: integer>bt ( x -- x ) [ dup zero? not ] [
    dup 3 rem {
      { 0 [ 3 / 0 ] }
      { 1 [ 3 / round 1 ] }
      { 2 [ 1 + 3 / round -1 ] }
    } case
  ] produce nip reverse
;
: bt>string ( seq -- str ) [ addlookup at ] map >string ;
: string>bt ( str -- seq ) [ addlookup value-at ] { } map-as ;

! Arithmetic
: bt-neg ( a -- -a ) [ neg ] map ;
:: bt-add ( u v -- w ) 
  u v max-length :> maxl
  u v [ maxl 0 pad-head reverse ] bi@ :> ( u v )
  0 :> carry!
  u v { } [ carry bt-add-digits carry! prefix ] 2reduce
  carry prefix [ zero? ] trim-head
;
: bt-sub ( u v -- w ) bt-neg bt-add ;
:: bt-mul ( u v -- w ) u { } [
    {
      { -1 [ v bt-neg ] }
      { 0  [ { } ] }
      { 1  [ v ] }
    } case bt-add 0 suffix
  ] reduce
  1 head*
;

[let
  "+-0++0+" string>bt :> a
  -436 integer>bt     :> b
  "+-++-" string>bt   :> c
  b c bt-sub a bt-mul :> d
  "a" a bt>integer a bt>string "%s: %d, %s\n" printf
  "b" b bt>integer b bt>string "%s: %d, %s\n" printf
  "c" c bt>integer c bt>string "%s: %d, %s\n" printf
  "a*(b-c)" d bt>integer d bt>string "%s: %d, %s\n" printf
]
