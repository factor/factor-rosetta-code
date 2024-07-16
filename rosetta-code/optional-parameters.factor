! Task:
! 
! Define a function/method/subroutine which sorts a sequence ("table") of
! sequences ("rows") of strings ("cells"), by one of the strings. Besides
! the input to be sorted, it shall have the following optional parameters:
! 
!     {|
! 
! |
! 
! ------------------------------------------------------------------------
! 
! ordering
!     A function specifying the ordering of strings; lexicographic by
!     default.
! 
! column
!     An integer specifying which string of each row to compare; the first
!     by default.
! 
! reverse
!     Reverses the ordering.
! 
! ------------------------------------------------------------------------
! 
! |}
! 
! This task should be considered to include both positional and named
! optional parameters, as well as overloading on argument count as in Java
! or selector name as in Smalltalk, or, in the extreme, using different
! function names. Provide these variations of sorting in whatever way is
! most natural to your language. If the language supports both methods
! naturally, you are encouraged to describe both.
! 
! Do not implement a sorting algorithm; this task is about the interface.
! If you can't use a built-in sort routine, just omit the implementation
! (with a comment).
! 
! See also:
! 
! -   Named Arguments

USING: accessors combinators io kernel math.order prettyprint
sequences sorting ;

TUPLE: table-sorter
    data
    { column initial: 0 }
    reversed?
    { ordering initial: [ ] } ;

: <table-sorter> ( -- obj ) table-sorter new ;

: sort-table ( table-sorter -- matrix )
    {
        [ data>> ]
        [ column>> [ swap nth ] curry ]
        [ ordering>> compose ]
        [ reversed?>> [ >=< ] [ <=> ] ? [ bi@ ] prepose curry ]
    } cleave [ sort ] curry call( x -- x ) ;


! ===== Now we can use the interface defined above =====

CONSTANT: table
    { { "a" "b" "c" } { "" "q" "z" } { "can" "z" "a" } }

"Unsorted" print
table simple-table.

"Default sort" print
<table-sorter>
    table >>data
sort-table simple-table.

"Sorted by col 2" print
<table-sorter>
    table >>data
    2 >>column
sort-table simple-table.

"Sorted by col 1" print
<table-sorter>
    table >>data
    1 >>column
sort-table simple-table.

"Reverse sorted by col 1" print
<table-sorter>
    table >>data
    1 >>column
    t >>reversed?
sort-table simple-table.

"Sorted by decreasing length" print
<table-sorter>
    table >>data
    t >>reversed?
    [ length ] >>ordering
sort-table simple-table.
