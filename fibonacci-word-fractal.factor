! The Fibonacci word may be represented as a fractal as described here:
! 
! (Clicking on the above website   (hal.archives-ouvertes.fr) will leave a
! cookie.)
! 
!     For F_word_(m) start with F_wordChar_(n=1)
!     Draw a segment forward
!     If current F_wordChar is 0
! 
!         Turn left if n is even
!         Turn right if n is odd
!     next n and iterate until end of F_word
! 
! Task:
! 
! Create and display a fractal similar to Fig 1.
! 
! (Clicking on the above website   (hal.archives-ouvertes.fr) will leave a
! cookie.)

USING: accessors arrays combinators fry images images.loader
kernel literals make match math math.vectors pair-rocket
sequences ;
FROM: fry => '[ _ ;
IN: rosetta-code.fibonacci-word-fractal

! === Turtle code ==============================================

TUPLE: turtle heading loc ;
C: <turtle> turtle

: forward ( turtle -- turtle' )
    dup heading>> [ v+ ] curry change-loc ;
    
MATCH-VARS: ?a ;

CONSTANT: left { { 0 ?a } => [ ?a 0 ] { ?a 0 } => [ 0 ?a neg ] }
CONSTANT: right { { 0 ?a } => [ ?a neg 0 ] { ?a 0 } => [ 0 ?a ] }

: turn ( turtle left/right -- turtle' )
    [ dup heading>> ] dip match-cond 2array >>heading ; inline

! === Fib word =================================================
   
: fib-word ( n -- str )
    {
        1 => [ "1" ]
        2 => [ "0" ]
        [ [ 1 - fib-word ] [ 2 - fib-word ] bi append ]
    } case ;
    
! === Fractal ==================================================

: fib-word-fractal ( n -- seq )
    [
        [ { 0 -1 } { 10 417 } dup , <turtle> ] dip fib-word
        [
            1 + -rot forward dup loc>> ,
            -rot CHAR: 0 = [
                even? [ left turn ] [ right turn ] if
            ] [ drop ] if drop
        ] with each-index
    ] { } make ;
    
! === Image ====================================================

CONSTANT: w 598
CONSTANT: h 428

: init-img-data ( -- seq )
    w h * 4 * [ 255 ] B{ } replicate-as ;

: <fib-word-fractal-img> ( -- img )
    <image>
    ${ w h }         >>dim
    BGRA             >>component-order
    ubyte-components >>component-type
    init-img-data    >>bitmap ;
    
: fract>img ( seq -- img' )
    [ <fib-word-fractal-img> dup ] dip [
        '[ B{ 33 33 33 255 } _ first2 ] dip set-pixel-at
    ] with each ;
    
: main ( -- )
    23 fib-word-fractal fract>img "fib-word-fractal.png"
    save-graphic-image ;
    
MAIN: main
