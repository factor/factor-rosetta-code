! Task:
! 
! Display the current date in the formats of:
! 
! -   -   2007-11-23 and
!     -   Friday, November 23, 2007

USING: formatting calendar io ;

now "%Y-%m-%d" strftime print
now "%A, %B %d, %Y" strftime print
