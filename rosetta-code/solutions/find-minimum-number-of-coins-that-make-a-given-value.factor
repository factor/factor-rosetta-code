! Task:
! 
! Find and show here on this page the minimum number of coins that can
! make a value of 988.
! 
! Available coins are: 1, 2, 5, 10, 20, 50, 100, and 200.
! 
! The coins that would be dispensed are:
! 
!      four coins of 200
!       one coin  of 100
!       one coin  of  50 
!       one coin  of  20
!       one coin  of  10 
!       one coin  of   5 
!       one coin  of   2
!       one coin  of   1

USING: assocs kernel math math.order prettyprint sorting ;

: make-change ( value coins -- assoc )
    [ >=< ] sort [ /mod swap ] zip-with nip ;

988 { 1 2 5 10 20 50 100 200 } make-change .
