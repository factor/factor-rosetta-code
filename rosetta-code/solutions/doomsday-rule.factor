! About the task
! 
! John Conway (1937-2020), was a mathematician who also invented several
! mathematically oriented computer pastimes, such as the famous Game of
! Life cellular automaton program. Dr. Conway invented a simple algorithm
! for finding the day of the week, given any date. The algorithm was based
! on calculating the distance of a given date from certain "anchor days"
! which follow a pattern for the day of the week upon which they fall.
! 
! Algorithm
! 
! The formula is calculated assuming that Sunday is 0, Monday 1, and so
! forth with Saturday 7, and
! 
!    doomsday = (Tuesday(or 2) + 5(y mod 4) + 4(y mod 100) + 6(y mod 400)) % 7
! 
! which, for 2021, is 0 (Sunday).
! 
! To calculate the day of the week, we then count days from a close
! doomsday, with these as charted here by month, then add the doomsday for
! the year, then get the remainder after dividing by 7. This should give
! us the number corresponding to the day of the week for that date.
! 
!    Month           Doomsday Dates for Month
!    --------------------------------------------
!    January (common years)   3, 10, 17, 24, 31
!    January (leap years)     4, 11, 18, 25
!    February (common years)  7, 14, 21, 28
!    February (leap years)    1, 8, 15, 22, 29
!    March                    7, 14, 21, 28
!    April                    4, 11, 18, 25
!    May                      2, 9, 16, 23, 30
!    June                     6, 13, 20, 27
!    July                     4, 11, 18, 25
!    August                   1, 8, 15, 22, 29
!    September                5, 12, 19, 26
!    October                  3, 10, 17, 24, 31
!    November                 7, 14, 21, 28
!    December                 5, 12, 19, 26
! 
! Task
! 
! Given the following dates:
! 
! -   1800-01-06 (January 6, 1800)
! -   1875-03-29 (March 29, 1875)
! -   1915-12-07 (December 7, 1915)
! -   1970-12-23 (December 23, 1970)
! -   2043-05-14 (May 14, 2043)
! -   2077-02-12 (February 12, 2077)
! -   2101-04-02 (April 2, 2101)
! 
! Use Conway's Doomsday rule to calculate the day of the week for each
! date.
! 
! see also
! 
! -   Doomsday rule
! -   Tomorrow is the Day After Doomsday (p.28)
! 
! Category:Date and time

USING: accessors calendar calendar.english formatting
generalizations kernel math math.order math.vectors sequences ;

: check-year ( year -- )  ! months and days checked by <date>
    1582 9999 between?
    [ "Year must be between 1582 and 9999." throw ] unless ;

: doomsday ( year -- n )
    { 4 100 400 } [ mod ] with map { 5 4 6 } vdot 2 + 7 mod ;

: anchorday ( year month -- m )
    1 - swap leap-year? { 4 1 } { 3 7 } ?
    { 7 4 2 6 4 1 5 3 7 5 } append nth ;

: weekday ( date -- str )
    [ year>> dup check-year doomsday ] [ day>> + ]
    [ dup year>> swap month>> anchorday - 7 + 7 mod ] tri
    day-names nth ;

: test ( date -- )
    [ "%B %d, %Y" strftime ]
    [ now before? "was" "will be" ? ]
    [ weekday ] tri
    "%s %s on a %s.\n" printf ;

1800 1 6
1875 3 29
1915 12 7
1970 12 23
2043 5 14
2077 2 12
2101 4 2
[ <date> test ] 3 7 mnapply
