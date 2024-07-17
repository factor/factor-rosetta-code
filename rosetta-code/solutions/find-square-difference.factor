! Task:
! 
! Find and show on this page the least positive integer number n, where
! difference of n*n and (n-1)*(n-1) greater than 1000.
! 
! The result is 501 because 501*501 - 500*500 = 251001 - 250000 = 1001 >
! 1000.

USING: math math.functions prettyprint ;

: least-sq ( m -- n ) 2 / 1 + ceiling ;

1000 least-sq .
