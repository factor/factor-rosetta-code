! Task:
! 
! Find positive decimal integers n in which the digit 1 occurs exactly
! twice, where n < 1,000.

USING: io math math.functions prettyprint sequences
sequences.extras ;

{ 0 2 3 4 5 6 7 8 9 }
[| n | { { n 1 1 } { 1 n 1 } { 1 1 n } } ] map-concat
[ <reversed> 0 [ 10^ * + ] reduce-index pprint bl ] each nl
