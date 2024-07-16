! Write a program or a script that returns the last Sundays of each month
! of a given year. The year may be given through any simple input method
! in your language (command line, std in, etc).
! 
! Example of an expected output:
! 
!     ./last_sundays 2013
!     2013-01-27
!     2013-02-24
!     2013-03-31
!     2013-04-28
!     2013-05-26
!     2013-06-30
!     2013-07-28
!     2013-08-25
!     2013-09-29
!     2013-10-27
!     2013-11-24
!     2013-12-29
! 
! Related tasks
! 
! -   Day of the week
! -   Five weekends
! -   Last Friday of each month

USING: calendar calendar.format command-line io kernel math math.parser
sequences ;
IN: rosetta-code.last-sunday

: parse-year     (    -- ts  ) (command-line) second string>number <year> ;
: print-last-sun ( ts --     ) last-sunday-of-month (timestamp>ymd) nl ;
: inc-month      ( ts -- ts' ) 1 months time+ ;
: process-month  ( ts -- ts' ) dup print-last-sun inc-month ;
: main           (    --     ) parse-year 12 [ process-month ] times drop ;

MAIN: main
