! Find all the positive integers whose decimal digits are all primes and
! sum to 13.

USING: formatting io kernel math math.combinatorics
math.functions math.ranges sequences sequences.extras ;

: digits>number ( seq -- n ) reverse 0 [ 10^ * + ] reduce-index ;

"Numbers whose digits are prime and sum to 13:" print
{ 2 3 5 7 } 3 6 [a,b] [ selections [ sum 13 = ] filter ] with
map-concat [ digits>number ] map "%[%d, %]\n" printf

USING: io kernel math prettyprint sequences sequences.extras ;

{ } { { 2 } { 3 } { 5 } { 7 } } [
    { 2 3 5 7 } [ suffix ] cartesian-map concat
    [ sum 13 = ] partition [ append ] dip [ sum 11 > ] reject
] until-empty [ bl ] [ [ pprint ] each ] interleave nl
