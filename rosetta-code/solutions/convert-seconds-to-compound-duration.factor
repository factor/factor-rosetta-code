! Task:
! 
! Write a function or program which:
! 
! -   takes a positive integer representing a duration in seconds as input
!     (e.g., 100), and
! -   returns a string which shows the same duration decomposed into:
!     -   -   weeks,
!         -   days,
!         -   hours,
!         -   minutes, and
!         -   seconds.
! 
! This is detailed below (e.g., "2 hr, 59 sec").
! 
! Demonstrate that it passes the following three test-cases:
! 
! Test Cases
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! input number ! output string |- | 7259 | 2 hr, 59 sec |- | 86400 |
! 1 d |- | 6000000 | 9 wk, 6 d, 10 hr, 40 min |}
! 
! Details
! 
! The following five units should be used:
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! unit ! suffix used in output ! conversion |- | week | wk | 1 week =
! 7 days |- | day | d | 1 day = 24 hours |- | hour | hr | 1 hour = 60
! minutes |- | minute | min | 1 minute = 60 seconds |- | second | sec | |}
! 
! However, only include quantities with non-zero values in the output
! (e.g., return "1 d" and not "0 wk, 1 d, 0 hr, 0 min, 0 sec").
! 
! Give larger units precedence over smaller ones as much as possible
! (e.g., return 2 min, 10 sec and not 1 min, 70 sec or 130 sec)
! 
! Mimic the formatting shown in the test-cases (quantities sorted from
! largest unit to smallest and separated by comma+space; value and unit of
! each quantity separated by space).
! 
! Category:Date and time

USING: assocs io kernel math math.parser qw sequences
sequences.generalizations ;

: mod/ ( x y -- w z ) /mod swap ;

: convert ( n -- seq )
    60 mod/ 60 mod/ 24 mod/ 7 mod/ 5 narray reverse ;
    
: .time ( n -- )
    convert [ number>string ] map qw{ wk d hr min sec } zip
    [ first "0" = ] reject [ " " join ] map ", " join print ;
    
7259 86400 6000000 [ .time ] tri@
