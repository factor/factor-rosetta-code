! Task:
! 
! Use the dictionary unixdict.txt
! 
! Find the words which contains all the vowels, but each vowel should
! appear only once in a word.
! 
! The length of any word shown should have a length '''> 10.

USING: grouping io.encodings.ascii io.files math prettyprint
sequences sets.extras ;

"unixdict.txt" ascii file-lines
[ length 10 > ] filter
[ non-repeating "aeiou" superset? ] filter
5 group simple-table.
