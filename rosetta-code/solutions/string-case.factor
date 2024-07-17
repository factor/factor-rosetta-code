! Task:
! 
! Take the string alphaBETA and demonstrate how to convert it to:
! 
! -   -   upper-case and
!     -   lower-case
! 
! Use the default encoding of a string literal or plain ASCII if there is
! no string literal in your language.
! 
! Note: In some languages alphabets toLower and toUpper is not reversable.
! 
! Show any additional case conversion functions (e.g. swapping case,
! capitalizing the first letter, etc.) that may be included in the library
! of your language.

"alphaBETA" >lower  ! "alphabeta"
"alphaBETA" >upper  ! "ALPHABETA"
"alphaBETA" >title  ! "Alphabeta"
"ß" >case-fold      ! "ss"
