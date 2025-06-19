! Task:
! 
! Using a well-known testing-specific library/module/suite for your
! language, write some tests for your language's entry in Palindrome.
! 
! If your language does not have a testing specific library well known to
! the language's community then state this or omit the language.

USING: kernel sequences ;
IN: palindrome

: palindrome? ( string -- ? ) dup reverse = ;

USING: palindrome tools.test ;
IN: palindrome.tests

[ t ] [ "racecar" palindrome? ] unit-test
[ f ] [ "ferrari" palindrome? ] unit-test

( scratchpad ) "palindrome" test
