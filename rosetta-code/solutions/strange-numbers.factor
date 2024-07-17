! Definition:
! 
! n is a strange number (expressed in base ten) if every adjacent decimal
! digit differs from its neighbour by a prime number.
! 
! Task:
! 
! Show all strange numbers for 100 < n < 500
! 
! Stretch goal
! 
! Show the number of 10-digit strange numbers that begin with 1

USING: grouping io kernel math.ranges math.statistics
math.text.utils math.vectors prettyprint sequences ;

: strange? ( n -- ? )
    1 digit-groups differences vabs
    [ { 2 3 5 7 } member? ] all? ;

"Strange numbers in (100, 500):" print nl
100 500 (a,b) [ strange? ] filter dup
10 group [ [ pprint bl ] each nl ] each nl
length pprint " strange numbers found." print
