! Task:
! 
! Given three lists:
! 
! -   Numbers1 = [5,45,23,21,67]
! -   Numbers2 = [43,22,78,46,38]
! -   Numbers3 = [9,98,12,98,53]
! 
! then:
! 
! 1.  Select the minimum of Numbers[n], Numbers2[n] and Numbers3[n], where
!     n <= 5 (one based).
! 2.  Add minimum to a new list (Numbers).
! 3.  Show Numbers on this page.

USING: math.order sequences prettyprint ;

{ 5 45 23 21 67 } { 43 22 78 46 38 } { 9 98 12 98 53 }
[ min min ] 3map .
