! Task:
! 
! Write a function that returns the longest common substring of two
! strings.
! 
! Use it within a program that demonstrates sample output from the
! function, which will consist of the longest common substring between
! "thisisatest" and "testing123testing".
! 
! Note that substrings are consecutive characters within a string. This
! distinguishes them from subsequences, which is any sequence of
! characters within a string, even if there are extraneous characters in
! between them.
! 
! Hence, the longest common subsequence between "thisisatest" and
! "testing123testing" is "tsitest", whereas the longest common substring
! is just "test".
! 
! References:
! 
! -   Generalize Suffix Tree
! -   Ukkonen’s Suffix Tree Construction

USING: io sequences.extras ;

"thisisatest" "testing123testing" longest-subseq print
