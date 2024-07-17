! Given a list of words, (use the words from the dictionary unixdict.txt).
! 
! Take the letters at odd indices letters from each word. If the result is
! present in the list, then display the result. The length of the odd word
! should be > 4.

USING: formatting hash-sets io io.encodings.ascii io.files
kernel literals math sequences sequences.extras sets strings ;

<< CONSTANT: words $[ "unixdict.txt" ascii file-lines ] >>

CONSTANT: wordset $[ words >hash-set ]

: odd ( str -- newstr ) <evens> >string ;

"Odd words > 4:" print
words
[ length 8 > ] filter
[ odd wordset in? ] filter
[ dup odd "%-15s %s\n" printf ] each
