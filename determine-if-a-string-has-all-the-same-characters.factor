! Task:
! 
! Given a character string (which may be empty, or have a length of zero
! characters):
! 
! -   -   create a function/procedure/routine to:
!         -   -   determine if all the characters in the string are the
!                 same
!             -   indicate if or which character is different from the
!                 previous character
!     -   display each string and its length (as the strings are being
!         examined)
!     -   a zero─length (empty) string shall be considered as all the same
!         character(s)
!     -   process the strings from left─to─right
!     -   if all the same character, display a message saying such
!     -   if not all the same character, then:
!         -   -   display a message saying such
!             -   display what character is different
!             -   only the 1^(st) different character need be displayed
!             -   display where the different character is in the string
!             -   the above messages can be part of a single message
!             -   display the hexadecimal value of the different character
! 
! Use (at least) these seven test values (strings):
! 
! -   -   a string of length 0 (an empty string)
!     -   a string of length 3 which contains three blanks
!     -   a string of length 1 which contains: 2
!     -   a string of length 3 which contains: 333
!     -   a string of length 3 which contains: .55
!     -   a string of length 6 which contains: tttTTT
!     -   a string of length 9 with a blank in the middle: 4444 444k
! 
! Show all output here on this page.

USING: formatting io kernel math.parser sequences ;

: find-diff ( str -- i elt ) dup ?first [ = not ] curry find ;
: len. ( str -- ) dup length "%u — length %d — " printf ;
: same. ( -- ) "contains all the same character." print ;
: diff. ( -- ) "contains a different character at " write ;

: not-same. ( i elt -- )
    dup >hex diff. "index %d: '%c' (0x%s)\n" printf ;

: sameness-report. ( str -- )
    dup len. find-diff dup [ not-same. ] [ 2drop same. ] if ;

{
    ""
    "   "
    "2"
    "333"
    ".55"
    "tttTTT"
    "4444 444k"
} [ sameness-report. ] each
