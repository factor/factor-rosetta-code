! Task:
! 
! Using the dictionary unixdict.txt
! 
! find the words whose first and last three letters are equal.
! 
! The length of any word shown should have a length '''> 5.

USING: io io.encodings.ascii io.files kernel math sequences ;

"unixdict.txt" ascii file-lines
[ length 5 > ] filter
[ [ 3 head-slice ] [ 3 tail-slice* ] bi = ] filter
[ print ] each
