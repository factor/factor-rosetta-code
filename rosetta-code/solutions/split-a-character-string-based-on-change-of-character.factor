! Task:
! 
! Split a (character) string into comma (plus a blank) delimited strings
! based on a change of character (left to right).
! 
! Show the output here (use the 1^(st) example below).
! 
! Blanks should be treated as any other character (except they are
! problematic to display clearly). The same applies to commas.
! 
! For instance, the string:
! 
!  gHHH5YY++///\ 
! 
! should be split and show:
! 
!  g, HHH, 5, YY, ++, ///, \ 
! 
! Category: String manipulation Category:Strings Category:Simple

USE: splitting.monotonic
"gHHH5YY++///\\"
"aaabbccccdeeff" [ [ = ] monotonic-split ", " join print ] bi@
