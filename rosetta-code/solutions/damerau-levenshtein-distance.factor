! The Damerau-Levenshtein distance between two strings is the minimum
! number of unit-cost operations needed to transform one string into the
! other, allowing insertion, deletion, substitution, and transposition of
! two adjacent characters. Classical Levenshtein distance does not count
! an adjacent transposition as one edit.
! 
! This task uses the unrestricted Damerau-Levenshtein distance. A common
! simpler variant, optimal string alignment (OSA), permits transposition
! but restricts how substrings can be edited; it can return a different
! result. For example, the unrestricted distance from CA to ABC is 2
! (transpose CA to AC, then insert B), while OSA returns 3.
! 
! Task
! 
! - Implement a function that calculates the unrestricted unit-cost
!   Damerau-Levenshtein distance of two input strings, or use a standard
!   library routine that computes that exact distance.
! - Show results for the following test cases (comparison units in these
!   examples are ASCII characters):
! 
!   First string   Second string   Expected distance
!   -------------- --------------- -------------------
!   ""             ""              0
!   ""             "abc"           3
!   "cat"          "cat"           0
!   "form"         "from"          1
!   "CA"           "ABC"           2
!   "kitten"       "sitting"       3
!   "ab"           "ba"            1
! 
! The CA/ABC case helps distinguish an unrestricted implementation from
! the OSA recurrence. Explain if the chosen library or implementation
! supports only OSA.
! 
! Related tasks
! 
! - Levenshtein distance
! - Levenshtein distance/Alignment
! 
! References
! 
! - F. J. Damerau (1964), A technique for computer detection and
!   correction of spelling errors, Communications of the ACM, 7(3),
!   171–176. DOI
! - R. Lowrance and R. A. Wagner (1975), An extension of the
!   string-to-string correction problem, Journal of the ACM, 22(2),
!   177–183. DOI
! - Damerau-Levenshtein distance: transpositions, OSA and unrestricted
!   algorithms — supplementary explanation of the distinction between the
!   two distance functions (contributor-affiliated resource).


