! Task:
! 
! Using the dictionary unixdict.txt, search words containing "the"
! substring,
! 
! then display the found words (on this page).
! 
! The length of any word shown should have a length '''> 11.

USING: io io.encodings.ascii io.files kernel math sequences ;

"unixdict.txt" ascii file-lines
[ length 11 > ] filter
[ "the" swap subseq? ] filter
[ print ] each
