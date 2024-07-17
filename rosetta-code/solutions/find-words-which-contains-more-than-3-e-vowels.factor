! Task:
! 
! Use the dictionary unixdict.txt
! 
! Find words which contains more than three e vowels and contains only e
! vowels.
! 
! Show the output here on this page.

USING: formatting io io.encodings.ascii io.files kernel math
sequences ;

"unixdict.txt" ascii file-lines
[ [ "aiou" member? ] any? ] reject
[ [ CHAR: e = ] count 3 > ] filter
[ 1 + "%2d: " printf print ] each-index
