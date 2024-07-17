! Task:
! 
! Given a list of strings, find the characters appearing exactly once in
! each string.
! 
! The result should be in alphabetical order.
! 
! Use the following list for this task:
! 
!         ["1a3c52debeffd", "2b6178c97a938stf", "3ycxdb1fgxa2yz"]
! 
! For this list, the result would be: 1 2 3 a b c

USING: io kernel sequences.interleaved sets sorting ;

{ "1a3c52debeffd" "2b6178c97a938sf" "3ycxdb1fgxa2yz" }
[ intersect-all ] [ [ duplicates ] gather without ] bi
natural-sort CHAR: space <interleaved> print

! How it works:
! intersect-all           obtain elements present in every string                        ->  "1a3c2bf"
! [ duplicates ] gather   obtain elements that repeat within a single string             ->  "efd798xy"
! without                 from the first string, remove elements that are in the second  ->  "1a3c2b"
