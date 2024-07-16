! An ordered word is a word in which the letters appear in alphabetic
! order.
! 
! Examples include abbey and dirt.
! 
! Find and display all the ordered words in the dictionary unixdict.txt
! that have the longest word length.
! 
! (Examples that access the dictionary file locally assume that you have
! downloaded this file yourself.)
! 
! The display needs to be shown on this page.

USING: grouping http.client io io.encodings.utf8 io.files
io.files.temp kernel math memoize sequences sequences.extras
unicode.case urls ;
IN: rosetta-code.ordered-words

MEMO: word-list ( -- seq )
    "unixdict.txt" temp-file dup exists? [
        URL" http://puzzlers.org/pub/wordlists/unixdict.txt"
        over download-to
    ] unless utf8 file-lines ;

: ordered-word? ( word -- ? )
    >lower [ <= ] monotonic? ;

: ordered-words-main ( -- )
    word-list [ ordered-word? ] filter
    all-longest [ print ] each ;
