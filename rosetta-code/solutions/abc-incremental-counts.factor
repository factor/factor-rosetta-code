! Write a routine (function, subroutine, procedure, whatever it may be
! called in your language,) that when given a set of three letters, (a, b,
! c) for instance, will identify words that contain each of those letters,
! in differing amounts, and where each count differs from another by
! exactly 1. Ignore any characters that are not in the given search group.
! 
! For example: using the letters (a, b, c) the "word" 'abbccc' would be
! valid (1(a), 2(b) & 3(c)), as would 'acodablaccab' (2(b), 3(c) & 4(a)).
! 
! Do not hard code the letters to search for. Do not create three
! different single purpose search routines. Instead, create a generic
! routine that uses a given set of letters as its search criteria. Include
! some mechanism to limit the minimum count for the least common letter.
! 
! You may assume that the words are all lower case, or may choose to
! regularize the case of the words. In either case assume upper and lower
! case are the same. (The test files contain all and only lower case.)
! 
! Task
! 
! Write a general purpose routine to identify incremental letter count
! words following the above description.
! 
! Using the unixdict.txt from http://wiki.puzzlers.org, find and display
! the words that are identified as incremental count words, or if no words
! are found that match.
! 
! -   -   Search for words containing (a b c) with a minimum count of 1
!     -   Search for words containing (t h e) with a minimum count of 1
!     -   Search for words containing (c i o) with a minimum count of 2
! 
! Show the output here, on this page.
! 
! Stretch
! 
! Use the same routine to search the words_alpha.txt file from
! https://github.com/dwyl/english-words using the same letter groups, but
! with a minimum 1 higher.
! 
! -   -   Search for words containing (a b c) with a minimum count of 2
!     -   Search for words containing (t h e) with a minimum count of 2
!     -   Search for words containing (c i o) with a minimum count of 3
! 
! Related
! 
! ABC correlation


