! Task
! 
! A particular activity of bats occurs at these times of the day:
! 
!     23:00:17, 23:40:20, 00:12:45, 00:17:19
! 
! Using the idea that there are twenty-four hours in a day, which is
! analogous to there being 360 degrees in a circle, map times of day to
! and from angles; and using the ideas of Averages/Mean angle compute and
! show the average time of the nocturnal activity to an accuracy of one
! second of time.

USING: arrays formatting kernel math math.combinators
math.functions math.libm math.parser math.trig qw sequences
splitting ;
IN: rosetta-code.mean-time

CONSTANT: input qw{ 23:00:17 23:40:20 00:12:45 00:17:19 }

: time>deg ( hh:mm:ss -- x )
    ":" split [ string>number ] map first3
    [ 15 * ] [ 1/4 * ] [ 1/240 * ] tri* + + ;

: mean-angle ( seq -- x )
    [ deg>rad ] map [ [ sin ] map-sum ] [ [ cos ] map-sum ]
    [ length ] tri recip [ * ] curry bi@ fatan2 rad>deg ;

: cutf ( x -- str y )
    [ >integer number>string ] [ dup floor - ] bi ;

: mean-time ( seq -- str )
    [ time>deg ] map mean-angle [ 360 + ] when-negative 24 *
    360 / cutf 60 * cutf 60 * round cutf drop 3array ":" join ; 

: mean-time-demo ( -- )
    input dup mean-time "Mean time for %u is %s.\n" printf ;

MAIN: mean-time-demo
