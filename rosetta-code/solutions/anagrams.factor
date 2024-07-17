! When two or more words are composed of the same characters, but in a
! different order, they are called anagrams.
! 
! Task
! 
! Using the word list at
! http://wiki.puzzlers.org/pub/wordlists/unixdict.txt,
! 
! find the sets of words that share the same characters that contain the
! most words in them.
! 
! Related tasks

 "resource:unixdict.txt" utf8 file-lines
 [ [ natural-sort >string ] keep ] { } map>assoc sort-keys
 [ [ first ] compare +eq+ = ] monotonic-split
 dup 0 [ length max ] reduce '[ length _ = ] filter [ values ] map .
