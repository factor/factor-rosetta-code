! Task:
! 
! Expand the range description:
! 
!   -6,-3--1,3-5,7-11,14,15,17-20 
! 
! Note that the second element above, is the range from minus 3 to minus
! 1.
! 
! Related task:
! 
! -   Range extraction

USING: kernel math.parser math.ranges prettyprint regexp
sequences sequences.extras splitting ;

: expand ( str -- seq )
    "," split [
        R/ (?<=\d)-/ re-split [ string>number ] map
        dup length 2 = [ first2 [a,b] ] when
    ] map-concat ;

"-6,-3--1,3-5,7-11,14,15,17-20" expand .
