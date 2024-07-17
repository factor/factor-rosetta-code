! Task:
! 
! Use the dictionary unixdict.txt
! 
! Ignore any word in the dictionary whose length is less than 9.
! 
! Let's take the words from next characters:
! 
! 1 <= n < (dictionary length) - 9.
! 
! char1 = 1^(st) character of n^(th) word.
! 
! char2 = 2^(nd) character of (n+1)^(th) word.
! 
! char3 = 3^(rd) character of (n+2)^(th) word.
! 
!    ⋮ 
! 
! char9 = 9^(th) character of (n+8)^(th) word.
! 
! Concatenate (append) the nine characters by:
! 
!       newword = char1 + char2 + char3 + ... + char9 
! 
! If newword is in the dictionary, then show on this page.
! 
! Length of newword = 9

USING: formatting grouping hash-sets io.encodings.ascii io.files
kernel literals math math.matrices sequences sequences.extras
sets strings ;

<< CONSTANT: words $[ "unixdict.txt" ascii file-lines ] >>

CONSTANT: wordset $[ words >hash-set ]

words                                       ! place word list on data stack
[ length 9 < ] reject                       ! remove small words from list
9 <clumps>                                  ! create virtual sequence of every 9 adjacent words (overlapping)
[ main-diagonal >string ]                   ! map clump to its diagonal
[ wordset in? ] map-filter                  ! filter diagonals that are words
members                                     ! remove duplicates
[ 1 + swap "%2d. %s\n" printf ] each-index  ! print words formatted nicely
