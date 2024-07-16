! Task:
! 
! Write a program or a script that returns the date of the last Fridays of
! each month of a given year.
! 
! The year may be given through any simple input method in your language
! (command line, std in, etc).
! 
! Example of an expected output:
! 
!     ./last_fridays 2012
!     2012-01-27
!     2012-02-24
!     2012-03-30
!     2012-04-27
!     2012-05-25
!     2012-06-29
!     2012-07-27
!     2012-08-31
!     2012-09-28
!     2012-10-26
!     2012-11-30
!     2012-12-28
! 
! Related tasks
! 
! -   Five weekends
! -   Day of the week
! -   Find the last Sunday of each month

USING: calendar calendar.format command-line io kernel math.parser sequences ;
IN: rosetta-code.last-fridays

(command-line) second string>number <year> 12 <iota>
[ months time+ last-friday-of-month ] with map
[ timestamp>ymd print ] each
