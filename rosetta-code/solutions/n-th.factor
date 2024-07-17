! Write a function/method/subroutine/... that when given an integer
! greater than or equal to zero returns a string of the number followed by
! an apostrophe then the ordinal suffix.
! 
! Example:
! 
! Returns would include 1'st 2'nd 3'rd 11'th 111'th 1001'st 1012'th
! 
! Task:
! 
! Use your routine to show here the output for at least the following
! (inclusive) ranges of integer inputs: 0..25, 250..265, 1000..1025
! 
! Note: apostrophes are now optional to allow correct apostrophe-less
! English.
! 
! Category:String manipulation

USING: io kernel math math.order math.parser math.ranges qw
sequences ;
IN: rosetta-code.nth

: n'th ( n -- str )
    dup 10 /mod swap 1 = [ drop 0 ] when
    [ number>string ]
    [ 4 min qw{ th st nd rd th } nth ] bi* append ;

: n'th-demo ( -- )
    0 25 250 265 1000 1025 [ [a,b] ] 2tri@
    [ [ n'th write bl ] each nl ] tri@ ;

MAIN: n'th-demo
