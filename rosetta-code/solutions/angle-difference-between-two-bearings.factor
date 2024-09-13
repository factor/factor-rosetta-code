! Finding the angle between two bearings is often confusing.[1]
! 
! Task:
! 
! Find the angle which is the result of the subtraction b2 - b1, where b1
! and b2 are the bearings.
! 
! Input bearings are expressed in the range -180 to +180 degrees.
! 
! The result is also expressed in the range -180 to +180 degrees.
! 
! Compute the angle for the following pairs:
! 
! -   20 degrees (b1) and 45 degrees (b2)
! -   -45 and 45
! -   -85 and 90
! -   -95 and 90
! -   -45 and 125
! -   -45 and 145
! -   29.4803 and -88.6381
! -   -78.3251 and -159.036
! 
! Optional extra:
! 
! Allow the input bearings to be any (finite) value.
! 
! Test cases:
! 
! -   -70099.74233810938 and 29840.67437876723
! -   -165313.6666297357 and 33693.9894517456
! -   1174.8380510598456 and -154146.66490124757
! -   60175.77306795546 and 42213.07192354373
! 
! Category:Geometry
! 
! [1] 1

USING: combinators generalizations kernel math prettyprint ;
IN: rosetta-code.bearings

: delta-bearing ( x y -- z )
    swap - 360 mod {
        { [ dup 180 > ] [ 360 - ] }
        { [ dup -180 < ] [ 360 + ] }
        [ ]
    } cond ;

: bearings-demo ( -- )
    20 45
    -45 45
    -85 90
    -95 90
    -45 125
    -45 145
    29.4803 -88.6381
    -78.3251 -159.036
    -70099.74233810938 29840.67437876723
    -165313.6666297357 33693.9894517456
    1174.8380510598456 -154146.66490124757
    60175.77306795546 42213.07192354373
    [ delta-bearing . ] 2 12 mnapply ;

MAIN: bearings-demo
