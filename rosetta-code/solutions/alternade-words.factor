! An alternade is a word whose alternating letters themselves form two
! words.
! 
! Example:
! 
! The word lounge contains the word lug (lounge) and the word one
! (lounge).
! 
! For a word to be an alternade, all its letters must be used.
! 
! The two words that form an alternade don't need to be the same length;
! for example, the word board is an alternade made up of the words bad
! (board) and or (board).
! 
! Task:
! 
! Print out every alternade in unixdict.txt whose length is 6 or greater,
! also showing both the words that make up the alternade.
! 
! See also:
! 
! -   -   Wikipedia entry: Alternade

USING: formatting io.encodings.ascii io.files kernel literals
math sequences sequences.extras sets strings ;

<< CONSTANT: words $[ "unixdict.txt" ascii file-lines ] >>

CONSTANT: wordset $[ words HS{ } set-like ]

: word? ( str -- ? ) wordset in? ;

: subwords ( str -- str str )
    dup <evens> >string swap <odds> >string ;

: alternade? ( str -- ? ) subwords [ word? ] both? ;

words
[ alternade? ] filter
[ length 5 > ] filter
[ dup subwords "%-8s %-4s %-4s\n" printf ] each
