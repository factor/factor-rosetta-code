! Definition
! 
! For the purposes of this task a hex word means a word which (in lower
! case form) consists entirely of the letters a, b, c, d, e and f.
! 
! Task
! 
! Using unixdict.txt, find all hex words with 4 letters or more.
! 
! Convert each such word to its decimal equivalent and compute its base 10
! digital root.
! 
! Display all three in increasing order of digital root and show the total
! count of such words.
! 
! Keeping only words which contain at least 4 distinct letters, display
! the same statistics but in decreasing order of decimal equivalent
! together with their total count.

USING: formatting io io.encodings.ascii io.files kernel literals
math math.parser prettyprint sequences sets sorting ;

CONSTANT: words $[
    "unixdict.txt" ascii file-lines
    [ length 3 > ] filter
    [ "abcdef" subset? ] filter
]

: droot ( m -- n ) 1 - 9 mod 1 + ;

: info. ( str -- ) dup hex> dup droot "%-8s-> %-10d-> %d\n" printf ;

: info-by ( quot ? -- )
    [ sort-with ] [ inv-sort-with ] if [ length ] keep
    [ info. ] each pprint ; inline

words [ hex> droot ] t info-by
" hex words with 4 or more letters found." print nl

words [ cardinality 3 > ] filter [ hex> ] f info-by
" such words found which contain 4 or more different digits." print
