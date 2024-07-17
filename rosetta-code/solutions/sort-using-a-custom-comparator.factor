! Task:
! 
! Sort an array (or list) of strings in order of descending length, and in
! ascending lexicographic order for strings of equal length.
! 
! Use a sorting facility provided by the language/library, combined with
! your own callback comparison function.
! 
! Note: Lexicographic order is case-insensitive.
! 
! Category:Sorting

: my-compare ( s1 s2 -- <=> )
    2dup [ length ] compare invert-comparison
    dup +eq+ = [ drop [ >lower ] compare ] [ 2nip ] if ;

{ "this" "is" "a" "set" "of" "strings" "to" "sort" } [ my-compare ] sort
