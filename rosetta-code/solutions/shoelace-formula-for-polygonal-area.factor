! Given the n + 1 vertices x[0], y[0] .. x[N], y[N] of a simple polygon
! described in a clockwise direction, then the polygon's area can be
! calculated by:
! 
!     abs( (sum(x[0]*y[1] + ... x[n-1]*y[n]) + x[N]*y[0]) -
!          (sum(x[1]*y[0] + ... x[n]*y[n-1]) + x[0]*y[N])
!        ) / 2
! 
! (Where abs returns the absolute value)
! 
! Task:
! 
! Write a function/method/routine to use the the Shoelace formula to
! calculate the area of the polygon described by the ordered points:
! 
!      (3,4), (5,11), (12,8), (9,5), and (5,6) 
! 
! Show the answer here, on this page.

USING: circular kernel math prettyprint sequences ;
IN: rosetta-code.shoelace

CONSTANT: input { { 3 4 } { 5 11 } { 12 8 } { 9 5 } { 5 6 } }

: align-pairs ( pairs-seq -- seq1 seq2 )
    <circular> dup clone [ 1 ] dip
    [ change-circular-start ] keep ;

: shoelace-sum ( seq1 seq2 -- n )
    [ [ first ] [ second ] bi* * ] 2map sum ;

: shoelace-area ( pairs-seq -- area )
    [ align-pairs ] [ align-pairs swap ] bi
    [ shoelace-sum ] 2bi@ - abs 2 / ;

input shoelace-area .
