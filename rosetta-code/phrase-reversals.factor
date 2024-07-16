! Task:
! 
! Given a string of space separated words containing the following phrase:
! 
!  rosetta code phrase reversal
! 
! :# Reverse the characters of the string.
! 
! :# Reverse the characters of each individual word in the string,
! maintaining original word order within the string.
! 
! :# Reverse the order of each word of the string, maintaining the order
! of characters in each word.
! 
! Show your output here.

USE: splitting

: splitp         ( str -- seq ) " " split ;
: printp         ( seq -- )     " " join print ;
: reverse-string ( str -- )     reverse print ;
: reverse-words  ( str -- )     splitp [ reverse ] map printp ;
: reverse-phrase ( str -- )     splitp reverse printp ;

"rosetta code phrase reversal" [ reverse-string ] [ reverse-words ] [ reverse-phrase ] tri
