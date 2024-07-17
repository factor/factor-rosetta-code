! Definitions
! 
! For the purposes of this task, an isogram means a string where each
! character present is used the same number of times and an n-isogram
! means an isogram where each character present is used exactly n times.
! 
! A heterogram means a string in which no character occurs more than once.
! It follows that a heterogram is the same thing as a 1-isogram.
! 
! Examples
! 
! caucasus is a 2-isogram because the letters c, a, u and s all occur
! twice.
! 
! atmospheric is a heterogram because all its letters are used once only.
! 
! Task
! 
! Using unixdict.txt and ignoring capitalization:
! 
! 1) Find and display here all words which are n-isograms where n > 1.
! 
! Present the results as a single list but sorted as follows:
! 
! a. By decreasing order of n;
! 
! b. Then by decreasing order of word length;
! 
! c. Then by ascending lexicographic order.
! 
! 2) Secondly, find and display here all words which are heterograms and
! have more than 10 characters.
! 
! Again present the results as a single list but sorted as per b. and c.
! above.
! 
! Reference
! 
! -   Wikipedia: Heterogram
! 
! Category: String manipulation Category:Strings

USING: assocs combinators.short-circuit.smart grouping io
io.encodings.ascii io.files kernel literals math math.order
math.statistics sequences sets sorting ;

CONSTANT: words $[ "unixdict.txt" ascii file-lines ]

: isogram<=> ( a b -- <=> )
    { [ histogram values first ] [ length ] } compare-with ;

: isogram-sort ( seq -- seq' )
    [ isogram<=> invert-comparison ] sort ;

: isogram? ( seq -- ? )
    histogram values { [ first 1 > ] [ all-eq? ] } && ;

: .words-by ( quot -- )
    words swap filter isogram-sort [ print ] each ; inline

"List of n-isograms where n > 1:" print
[ isogram? ] .words-by nl

"List of heterograms of length > 10:" print
[ { [ length 10 > ] [ all-unique? ] } && ] .words-by
