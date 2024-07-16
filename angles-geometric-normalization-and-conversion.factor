! This task is about the normalization and/or conversion of (geometric)
! angles using some common scales.
! 
! The angular scales that will be used in this task are:
! 
! -   -   degree
!     -   gradian
!     -   mil
!     -   radian
! 
! Definitions:
! 
! The angular scales used or referenced here:
! 
! -   -   turn is a full turn or 360 degrees, also shown as 360º
!     -   degree is ¹/₃₆₀ of a turn
!     -   gradian is ¹/₄₀₀ of a turn
!     -   mil is ¹/₆₄₀₀ of a turn
!     -   radian is ¹/_(2π) of a turn (or ^(0.5)/_(π) of a turn)
! 
! Or, to put it another way, for a full circle:
! 
! -   -   there are 360 degrees
!     -   there are 400 gradians
!     -   there are 6,400 mils
!     -   there are 2π radians (roughly equal to 6.283+)
! 
! A mil is approximately equal to a milliradian (which is ¹/₁₀₀₀ of a
! radian).
! 
! There is another definition of a mil which is ¹/₁₀₀₀ of a radian ───
! this definition won't be used in this Rosetta Code task.
! 
! Turns are sometimes known or shown as:
! 
! -   -   turn(s)
!     -   360 degrees
!     -   unit circle
!     -   a (full) circle
! 
! Degrees are sometimes known or shown as:
! 
! -   -   degree(s)
!     -   deg
!     -   º (a symbol)
!     -   ° (another symbol)
! 
! Gradians are sometimes known or shown as:
! 
! -   -   gradian(s)
!     -   grad(s)
!     -   grade(s)
!     -   gon(s)
!     -   metric degree(s)
!     -   (Note that centigrade was used for ¹/₁₀₀^(th) of a grade, see
!         the note below.)
! 
! Mils are sometimes known or shown as:
! 
! -   -   mil(s)
!     -   NATO mil(s)
! 
! Radians are sometimes known or shown as:
! 
! -   -   radian(s)
!     -   rad(s)
! 
! Notes:
! 
! In continental Europe, the French term centigrade was used for ¹/₁₀₀ of
! a grad (grade); this was one reason for the adoption of the term Celsius
! to replace centigrade as the name of a temperature scale.
! 
! Gradians were commonly used in civil engineering.
! 
! Mils were normally used for artillery (elevations of the gun barrel for
! ranging).
! 
! Positive and negative angles:
! 
! Although the definition of the measurement of an angle doesn't support
! the concept of a negative angle, it's frequently useful to impose a
! convention that allows positive and negative angular values to represent
! orientations and/or rotations in opposite directions relative to some
! reference. It is this reason that negative angles will keep their sign
! and not be normalized to positive angles.
! 
! Normalization:
! 
! Normalization (for this Rosetta Code task) will keep the same sign, but
! it will reduce the magnitude to less than a full circle; in other words,
! less than 360º.
! 
! Normalization shouldn't change -45º to 315º,
! 
! An angle of 0º, +0º, 0.000000, or -0º should be shown as 0º.
! 
! Task:
! 
! -   -   write a function (or equivalent) to do the normalization for
!         each scale
!         -   -   Suggested names:
!             -   d2d, g2g, m2m, and  r2r
!     -   write a function (or equivalent) to convert one scale to another
!         -   -   Suggested names for comparison of different computer
!                 language function names:
!             -   d2g, d2m, and d2r for degrees
!             -   g2d, g2m, and g2r for gradians
!             -   m2d, m2g, and m2r for mils
!             -   r2d, r2g, and r2m for radians
!     -   normalize all angles used (except for the "original" or "base"
!         angle)
!     -   show the angles in every scale and convert them to all other
!         scales
!     -   show all output here on this page
! 
! For the (above) conversions, use these dozen numbers (in the order
! shown):
! 
! -   -   -2 -1 0 1 2 6.2831853 16 57.2957795 359 399 6399 1000000

USING: accessors combinators formatting inverse kernel math
math.constants quotations qw sequences units.si ;
IN: rosetta-code.angles

ALIAS: degrees arc-deg
: gradiens ( n -- d ) 9/10 * degrees ;
: mils ( n -- d ) 9/160 * degrees ;
: normalize ( d -- d' ) [ 2 pi * mod ] change-value ;
CONSTANT: units { degrees gradiens mils radians }

: .row ( angle unit -- )
    2dup "%-12u%-12s" printf ( x -- x ) execute-effect
    normalize units [ 1quotation [undo] call( x -- x ) ] with
    map "%-12.4f%-12.4f%-12.4f%-12.4f\n" vprintf ;

: .header ( -- )
    qw{ angle unit } units append
    "%-12s%-12s%-12s%-12s%-12s%-12s\n" vprintf ;

: angles ( -- )
    .header
    { -2 -1 0 1 2 6.2831853 16 57.2957795 359 399 6399 1000000 }
    units [ .row ] cartesian-each ;

MAIN: angles
