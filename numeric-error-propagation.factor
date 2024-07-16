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
!  d = √ (x1 - x2)² + (y1 - y2)²  
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

USING: arrays kernel locals math math.functions math.vectors
prettyprint sequences sequences.extras ;
IN: uncertain

<PRIVATE

: ubi* ( x y p q -- u )
    [ [ first2 ] bi@ swapd ] 2dip 2bi* 2array ; inline

: err+ ( x y -- z ) [ sq ] bi@ + sqrt ;

:: (u*) ( u1 u2 quot -- u )
    u1 u2 [ first2 ] bi@ :> ( v1 s1 v2 s2 )
    v1 v2 quot call :> val
    s1 v1 /f sq s2 v2 /f sq + val sq * sqrt :> sig
    val sig 2array ; inline

PRIVATE>

: u+n ( u n -- u ) 0 2array v+ ;
: n+u ( n u -- u ) swap u+n ;
: u-n ( u n -- u ) 0 2array v- ;
: n-u ( n u -- u ) [ 0 2array ] dip v- ;
: u+  ( u u -- u ) [ + ] [ err+ ] ubi* ;
: u-  ( u u -- u ) [ - ] [ err+ ] ubi* ;
: u*n ( u n -- u ) dup 2array [ * ] [ * abs ] ubi* ;
: n*u ( n u -- u ) swap u*n ;
: u/n ( u n -- u ) dup 2array [ /f ] [ * abs ] ubi* ;
: n/u ( n u -- u ) [ dup 2array ] dip [ /f ] [ * abs ] ubi* ;
: u*  ( u u -- u ) [ * ] (u*) ;
: u/  ( u u -- u ) [ /f ] (u*) ;

:: u^n ( u n -- u )
    u first2 :> ( v1 s1 )
    v1 n ^ >rect drop :> val
    val n * s1 v1 /f * abs :> sig
    val sig 2array ;

<PRIVATE

: uncertain-demo ( -- )
    { 100 1.1 } { 200 2.2 } u- 2.0 u^n
    { 50 1.2 } { 100 2.3 } u- 2.0 u^n u+ 0.5 u^n . ;

PRIVATE>

MAIN: uncertain-demo
