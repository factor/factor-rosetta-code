! Task:
! 
! Find and show on this page the minimum number of cells after, before,
! above and below N×N squares, where N = 10.

USING: io kernel math math.matrices math.vectors prettyprint
sequences ;

: square ( n -- matrix )
    [ <cartesian-square-indices> ] keep 1 - dup
    '[ dup sum _ > [ _ v-n vabs ] when infimum ] matrix-map ;

{ 10 9 2 1 } [ square simple-table. nl ] each
