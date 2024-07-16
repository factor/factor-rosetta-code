! Task:
! 
! Write a program that does the following in this order:
! 
! -   Input an amount of time to sleep in whatever units are most natural
!     for your language (milliseconds, seconds, ticks, etc.). This unit
!     should be noted in comments or in a description.
! -   Print "Sleeping..."
! -   Sleep the main thread for the given amount of time.
! -   Print "Awake!"
! -   End.
! 
! Related task:
! 
! -   Nautical bell

USING: calendar io math.parser threads ;

: read-sleep ( -- )
    readln string>number seconds
    "Sleeping..." print
    sleep
    "Awake!" print ;
