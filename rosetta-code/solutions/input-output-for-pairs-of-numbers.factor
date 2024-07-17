! From lines of input starting with a line containing the numbers of pairs
! to follows, followed by that number of pairs of integers separated by a
! space on separate lines from STDIN, output the sum of each pair to
! STDOUT.
! 
! Sample input with corresponding output:
! 
! Input
! 
!     5
!     1 2
!     10 20
!     -3 5
!     100 2
!     5 5
! 
! Output
! 
!     3
!     30
!     2
!     102
!     10


USING: io math.parser prettyprint sequences splitting ;
IN: rosetta-code.pair-output

: process-line ( str -- n )
    " " split [ string>number ] map-sum ;
: main ( -- ) lines 1 tail [ process-line ] map [ . ] each ;
    
MAIN: main

