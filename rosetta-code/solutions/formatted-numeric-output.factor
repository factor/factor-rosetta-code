! Task:
! 
! Express a number in decimal as a fixed-length string with leading zeros.
! 
! For example, the number 7.125 could be expressed as 00007.125.
! 
! Category:Text processing Category:Simple

USE: formatting
7.125 "%09.3f\n" printf
