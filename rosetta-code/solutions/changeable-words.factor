! Task:
! 
! Using the dictionary unixdict.txt, change one letter in a word, and if
! the changed word occurs in the dictionary,
! 
! then display the original word and the changed word here (on this page).
! 
! The length of any word shown should have a length '''> 11.
! 
! Note:
! 
! -   A copy of the specific unixdict.txt linked to should be used for
!     consistency of results.
! -   Words > 11 are required, ie of 12 characters or more.
! 
! Reference:
! 
! -   Levenshtein distance

USING: assocs combinators.short-circuit formatting
io.encodings.ascii io.files kernel math math.combinatorics
math.distances sequences ;

: changeable? ( str str -- ? )
    { [ [ length ] bi@ = ] [ hamming-distance 1 = ] } 2&& ;

"unixdict.txt" ascii file-lines
[ length 11 > ] filter
2 [ first2 changeable? ] filter-combinations
[ "%s <-> %s\n" printf ] assoc-each
