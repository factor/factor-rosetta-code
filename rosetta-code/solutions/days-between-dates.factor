! Task:
! 
! Calculate the number of days between two dates.
! 
! Date input should be of the form YYYY-MM-DD.
! 
! Motivation
! 
! To demonstrate one of the numerous ways this can be done.

USING: calendar calendar.parser kernel math prettyprint ;

: days-between ( ymd-str ymd-str -- n )
    [ ymd>timestamp ] bi@ time- duration>days abs ;

"2019-01-01" "2019-09-30" days-between .
"2016-01-01" "2016-09-30" days-between .  ! leap year
