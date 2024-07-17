! Task:
! 
! Show in decimal notation all positive integers (less than 501) which,
! when converted to hexadecimal notation, cannot be written without using
! at least one non-decimal digit ('a' to 'f').

USING: combinators formatting grouping io kernel lists
lists.lazy math prettyprint sequences ;

! Returns t if the hexadecimal representation of n contains a
! non-decimal digit.
: non-decimal? ( n -- ? )
    {
        { [ dup zero? ] [ drop f ] }
        { [ dup 0xF bitand 9 > ] [ drop t ] }
        [ -4 shift non-decimal? ]
    } cond ;

1 lfrom [ non-decimal? ] lfilter [ 501 < ] lwhile
list>array dup 15 group [ [ "%3d " printf ] each nl ] each nl
length pprint " such numbers found." print
