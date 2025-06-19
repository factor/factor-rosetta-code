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

USING: backtrack compiler.tree.propagation.call-effect
formatting io kernel sequences sequences.generalizations
tools.memory.private tools.time ;

: d ( digit -- digit next-digit )
    dup {
        { 2 3 5 7 }         ! from 0 we can get to these digits
        { 3 4 6 8 }         ! from 1 we can get to these
        { 0 4 5 7 9 }       ! etc...
        { 0 1 5 6 8 }
        { 1 2 6 7 9 }
        { 0 2 3 7 8 }
        { 1 3 4 8 9 }
        { 0 2 4 5 9 }
        { 1 3 5 6 }
        { 2 4 6 7 }
    } nth amb-lazy ;

[ [ 1 d d d d d d d d d 10 narray ] bag-of ] time

dup length commas write
" 10-digit strange numbers beginning with 1:" print
[ first2 ] [ last2 ] bi "%u\n%u\n...\n%u\n%u\n" printf
