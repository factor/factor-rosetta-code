! Task:
! 
! Create a function, or show a built-in function, to count the number of
! non-overlapping occurrences of a substring inside a string.
! 
! The function should take two arguments:
! 
! -   -   the first argument being the string to search, and
!     -   the second a substring to be searched for.
! 
! It should return an integer count.
! 
!     print countSubstring("the three truths","th")
!     3
! 
!     // do not count substrings that overlap with previously-counted substrings:
!     print countSubstring("ababababab","abab")
!     2
! 
! The matching should yield the highest number of non-overlapping matches.
! 
! In general, this essentially means matching from left-to-right or
! right-to-left (see proof on talk page).

USING: math sequences splitting ;
: occurences ( seq subseq -- n ) split-subseq length 1 - ;
