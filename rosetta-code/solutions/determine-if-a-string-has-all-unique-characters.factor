! Task:
! 
! Given a character string (which may be empty, or have a length of zero
! characters):
! 
! -   -   create a function/procedure/routine to:
!         -   -   determine if all the characters in the string are unique
!             -   indicate if or which character is duplicated and where
!     -   display each string and its length (as the strings are being
!         examined)
!     -   a zero─length (empty) string shall be considered as unique
!     -   process the strings from left─to─right
!     -   if unique, display a message saying such
!     -   if not unique, then:
!         -   -   display a message saying such
!             -   display what character is duplicated
!             -   only the 1^(st) non─unique character need be displayed
!             -   display where "both" duplicated characters are in the
!                 string
!             -   the above messages can be part of a single message
!             -   display the hexadecimal value of the duplicated
!                 character
! 
! Use (at least) these five test values (strings):
! 
! -   -   a string of length 0 (an empty string)
!     -   a string of length 1 which is a single period (.)
!     -   a string of length 6 which contains: abcABC
!     -   a string of length 7 which contains a blank in the middle: XYZ
!         ZYX
!     -   a string of length 36 which doesn't contain the letter "oh":
! 
!     
! 
!         1234567890ABCDEFGHIJKLMN0PQRSTUVWXYZ
! 
! Show all output here on this page.

USING: formatting fry generalizations io kernel math.parser
sequences sets ;

: repeated ( elt seq -- )
    [ dup >hex over ] dip indices first2
    "  '%c' (0x%s) at indices %d and %d.\n" printf ;

: uniqueness-report ( str -- )
    dup dup length "%u — length %d — contains " printf
    [ duplicates ] keep over empty?
    [ 2drop "all unique characters." print ]
    [ "repeated characters:" print '[ _ repeated ] each ] if ;

""
"."
"abcABC"
"XYZ ZYX"
"1234567890ABCDEFGHIJKLMN0PQRSTUVWXYZ"
[ uniqueness-report nl ] 5 napply
