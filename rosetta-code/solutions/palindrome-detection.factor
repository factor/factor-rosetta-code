! A palindrome is a phrase which reads the same backward and forward.
! 
! Write a function or program that checks whether a given sequence of
! characters (or, if you prefer, bytes) is a palindrome.
! 
! For extra credit:
! 
! -   Support Unicode characters.
! -   Write a second function (possibly as a wrapper to the first) which
!     detects inexact palindromes, i.e. phrases that are palindromes if
!     white-space and punctuation is ignored and case-insensitive
!     comparison is used.
! 
! -   It might be useful for this task to know how to reverse a string.
! -   This task's entries might also form the subjects of the task Test a
!     function.
! 
! Category:Recursion Category:String manipulation Category:Classic CS
! problems and programs Category:Palindromes

USING: kernel sequences ;
: palindrome? ( str -- ? ) dup reverse = ;
