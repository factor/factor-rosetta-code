! Definition
! 
! A word is an ABC word if the letters "a", "b" and "c" appear in the word
! in alphabetical order.
! 
! If any or all of these letters occur more than once in a word, then only
! the first occurrence of each letter should be used to determine whether
! a word is an ABC word or not.
! 
! Task
! 
! Show here (on this page) every ABC word in unixdict.txt.

USING: grouping io.encodings.ascii io.files kernel prettyprint
sequences sets ;

"unixdict.txt" ascii file-lines
[ "abc" within members "abc" = ] filter
5 group simple-table.
