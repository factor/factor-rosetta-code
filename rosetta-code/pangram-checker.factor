! A pangram is a sentence that contains all the letters of the English
! alphabet at least once.
! 
! For example: The quick brown fox jumps over the lazy dog.
! 
! Task:
! 
! Write a function or method to check a sentence to see if it is a pangram
! (or not) and show its use.
! 
! Related tasks:
! 
! -   -   determine if a string has all the same characters
!     -   determine if a string has all unique characters

: pangram? ( str -- ? )
    [ "abcdefghijklmnopqrstuvwxyz" ] dip >lower diff length 0 = ;

"How razorback-jumping frogs can level six piqued gymnasts!" pangram? .
