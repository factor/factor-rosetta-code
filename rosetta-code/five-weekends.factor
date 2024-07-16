! The month of October in 2010 has five Fridays, five Saturdays, and five
! Sundays.
! 
! Task:
! 
! 1.  Write a program to show all months that have this same
!     characteristic of five full weekends from the year 1900 through 2100
!     (Gregorian calendar).
! 2.  Show the number of months with this property (there should be 201).
! 3.  Show at least the first and last five dates, in order.
! 
! Algorithm suggestions
! 
! -   Count the number of Fridays, Saturdays, and Sundays in every month.
! -   Find all of the 31-day months that begin on Friday.
! 
! Extra credit
! 
! Count and/or show all of the years which do not have at least one
! five-weekend month (there should be 29).
! 
! Related tasks
! 
! -   Day of the week
! -   Last Friday of each month
! -   Find last sunday of each month

USING: calendar calendar.format formatting io kernel math
sequences ;

: timestamps>my ( months -- )
   [ { MONTH bl YYYY nl } formatted 2drop ] each ;

: month-range ( start-year #months -- seq )
    [ <year> ] [ <iota> ] bi* [ months time+ ] with map ;
    
: find-five-weekend-months ( months -- months' )
    [ [ friday? ] [ days-in-month ] bi 31 = and ] filter ;
    
1900 12 201 * month-range find-five-weekend-months
[ length "%d five-weekend months found.\n" printf ]
[ 5 head  timestamps>my "..." print ]
[ 5 tail* timestamps>my ] tri
