! If f, a, and b are values with uncertainties σ_(f), σ_(a), and σ_(b),
! and c is a constant;
! 
! then if f is derived from a, b, and c in the following ways,
! 
! then σ_(f) can be calculated as follows:
! 
! :;Addition/Subtraction
! 
! -   -   If f = a ± c, or f = c ± a then σ_(f) = σ_(a)
!     -   If f = a ± b then σ_(f)² = σ_(a)² + σ_(b)²
! 
! :;Multiplication/Division
! 
! -   -   If f = ca or f = ac then σ_(f) = |cσ_(a)|
!     -   If f = ab or f = a / b then σ_(f)² = f²( (σ_(a) / a)² + (σ_(b) /
!         b)²)
! 
! :;Exponentiation
! 
! -   -   If f = a^(c) then σ_(f) = |fc(σ_(a) / a)|
! 
! Caution:
! 
!     
! 
!         This implementation of error propagation does not address issues
!         of dependent and independent values. It is assumed that a and b
!         are independent and so the formula for multiplication should not
!         be applied to a*a for example. See the talk page for some of the
!         implications of this issue.
! 
! Task details:
! 
! 1.  Add an uncertain number type to your language that can support
!     addition, subtraction, multiplication, division, and exponentiation
!     between numbers with an associated error term together with 'normal'
!     floating point numbers without an associated error term.
! 
! Implement enough functionality to perform the following calculations.
! 
! 1.  Given coordinates and their errors:
! 
! x1 = 100 ± 1.1 y1 = 50 ± 1.2 x2 = 200 ± 2.2 y2 = 100 ± 2.3
! 
! if point p1 is located at (x1, y1) and p2 is at (x2, y2); calculate the distance between the two points using the classic Pythagorean formula: 
!  d = √  (x1 - x2)²  +  (y1 - y2)²   
! 
! 1.  Print and display both d and its error.
! 
! References:
! 
! -   A Guide to Error Propagation B. Keeney, 2005.
! -   Propagation of uncertainty Wikipedia.
! 
! Related task:
! 
! -   Quaternion type

USING: accessors arrays fry kernel locals math math.functions
multi-methods parser prettyprint prettyprint.custom sequences ;
RENAME: GENERIC: multi-methods => MM-GENERIC:
FROM: syntax => M: ;
IN: imprecise

TUPLE: imprecise
    { value float read-only }
    { sigma float read-only } ;

C: <imprecise> imprecise

: >imprecise< ( imprecise -- value sigma )
    [ value>> ] [ sigma>> ] bi ;

! Define a custom syntax for imprecise numbers.

<< SYNTAX: I{ \ } [ first2 <imprecise> ] parse-literal ; >>
M: imprecise pprint-delims drop \ I{ \ } ;
M: imprecise >pprint-sequence >imprecise< 2array ;
M: imprecise pprint* pprint-object ;

<PRIVATE

! Error functions

: f+-i ( float imprecise quot -- imprecise )
    [ >imprecise< ] dip dip <imprecise> ; inline

: i+-i ( imprecise1 imprecise2 quot -- imprecise )
    '[ [ value>> ] bi@ @ ]
    [ [ sigma>> sq ] bi@ + sqrt <imprecise> ] 2bi ; inline

: f*/i ( float imprecise quot -- imprecise )
    [ >imprecise< overd ] dip [ * abs ] 2bi* <imprecise> ;
    inline

:: i*/i ( a b quot -- imprecise )
    a b [ >imprecise< ] bi@ :> ( vala siga valb sigb )
    vala valb quot call :> val
    val sq siga sq * vala sq /f sigb sq + valb sq /f sqrt :> sig
    val sig <imprecise> ; inline

PRIVATE>

MM-GENERIC: ~+ ( obj1 obj2 -- imprecise ) foldable flushable
METHOD: ~+ { float imprecise } [ + ] f+-i ;
METHOD: ~+ { imprecise float } swap ~+ ;
METHOD: ~+ { imprecise imprecise } [ + ] i+-i ;    

MM-GENERIC: ~- ( obj1 obj2 -- imprecise ) foldable flushable
METHOD: ~- { float imprecise } [ - ] f+-i ;
METHOD: ~- { imprecise float } swap [ swap - ] f+-i ;
METHOD: ~- { imprecise imprecise } [ - ] i+-i ;

MM-GENERIC: ~* ( obj1 obj2 -- imprecise ) foldable flushable
METHOD: ~* { float imprecise } [ * ] f*/i ;
METHOD: ~* { imprecise float } swap ~* ;
METHOD: ~* { imprecise imprecise } [ * ] i*/i ;

MM-GENERIC: ~/ ( obj1 obj2 -- imprecise ) foldable flushable
METHOD: ~/ { float imprecise } [ /f ] f*/i ;
METHOD: ~/ { imprecise float } swap [ swap /f ] f*/i ;
METHOD: ~/ { imprecise imprecise } [ /f ] i*/i ;

:: ~^ ( a x -- imprecise )
    a >imprecise< :> ( vala siga )
    vala x ^ >rect drop :> val
    val x * siga vala /f * abs :> sig
    val sig <imprecise> ; foldable flushable

<PRIVATE

: imprecise-demo ( -- )
    I{ 100 1.1 } I{ 200 2.2 } ~- 2. ~^
    I{ 50 1.2 } I{ 100 2.3 } ~- 2. ~^ ~+ 0.5 ~^ . ;

PRIVATE>

MAIN: imprecise-demo
