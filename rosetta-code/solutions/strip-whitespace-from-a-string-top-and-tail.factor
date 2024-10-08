! Task:
! 
! Demonstrate how to strip leading and trailing whitespace from a string.
! 
! The solution should demonstrate how to achieve the following three
! results:
! 
! -   String with leading whitespace removed
! -   String with trailing whitespace removed
! -   String with both leading and trailing whitespace removed
! 
! For the purposes of this task whitespace includes non printable
! characters such as the space character, the tab character, and other
! such characters that have no corresponding graphical representation.

USE: unicode
"     test string    " [ blank? ] trim        ! leading and trailing
"     test string    " [ blank? ] trim-head   ! only leading
"     test string    " [ blank? ] trim-tail   ! only trailing
