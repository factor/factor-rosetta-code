! Task:
! 
! Using the dictionary unixdict.txt, find words which odd letters are
! consonants and even letters are vowels or vice versa.
! 
! Display the words here (on this page).
! 
! The length of any word shown should have a length '''> 9.

USING: grouping.extras io.encodings.ascii io.files kernel math
prettyprint sequences ;

"unixdict.txt" ascii file-lines
[ length 9 > ] filter
[ dup [ "aeiou" member? ] group-by [ length ] same? ] filter .
