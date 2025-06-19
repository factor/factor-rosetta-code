! Task:
! 
! Using the dictionary unixdict.txt
! 
! find the words whose first and last three letters are equal.
! 
! The length of any word shown should have a length '''> 5.

USING: io io.encodings.ascii io.files kernel math sequences ;

"unixdict.txt" ascii file-lines
[ length 5 > ] filter
[ [ 3 head-slice ] [ 3 tail-slice* ] bi = ] filter
[ print ] each

USING: combinators.short-circuit io io.encodings.ascii io.files
kernel math sequences ;

"unixdict.txt" ascii [
    [
        readln dup
        [
            dup
            {
                [ length 5 > ]
                [ [ 3 head-slice ] [ 3 tail-slice* ] bi = ]
            } 1&&
            [ print ] [ drop ] if
        ] when*
    ] loop
] with-file-reader

USING: io io.encodings.ascii io.files kernel lists lists.lazy
math sequences ;

"unixdict.txt" ascii <file-reader> llines
[ length 5 > ] lfilter
[ [ 3 head-slice ] [ 3 tail-slice* ] bi = ] lfilter
[ print ] leach
