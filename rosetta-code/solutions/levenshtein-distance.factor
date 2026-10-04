! In information theory and computer science, the Levenshtein distance is
! a metric for measuring the amount of difference between two sequences
! (i.e. an edit distance). The Levenshtein distance between two strings is
! defined as the minimum number of edits needed to transform one string
! into the other, with the allowable edit operations being insertion,
! deletion, or substitution of a single character.
! 
! Example
! 
!     
! 
! The Levenshtein distance between "kitten" and "sitting" is 3, since the
! following three edits change one into the other, and there isn't a way
! to do it with fewer than three edits:
! 
! ::# kitten sitten (substitution of 'k' with 's')
! 
! ::# sitten sittin (substitution of 'e' with 'i')
! 
! ::# sittin sitting (insert 'g' at the end).
! 
! ''The Levenshtein distance between "rosettacode", "raisethysword" is 8.
! 
! The distance between two strings is same as that when both strings are
! reversed.
! 
! Task
! 
!     
! 
! Implements a Levenshtein distance function, or uses a library function,
! to show the Levenshtein distance between "kitten" and "sitting".
! 
! Related task
! 
!     
! 
! - Longest common subsequence
! 
! Notes
! 
!     
! 
! - The classical Levenshtein distance uses insertion, deletion, and
!   substitution as its elementary edit operations. Adjacent transposition
!   is not a primitive operation of the classical metric; algorithms that
!   include transposition belong to related edit-distance variants such as
!   Damerau–Levenshtein distance.
! 
! - For sequences of lengths m and n, a common dynamic-programming
!   implementation computes the distance in O(mn) time. Storing the
!   complete dynamic-programming matrix requires O(mn) space, while
!   implementations that only require the final distance can keep one or
!   two rows and reduce auxiliary space to O(min(m, n)).
! 
! - Levenshtein distance is defined over sequences, so the comparison unit
!   matters. For Unicode text, a programming language may expose bytes,
!   encoding code units, Unicode code points, or other string elements.
!   These are not always equivalent to a user-perceived character.
! 
! - Canonically equivalent Unicode strings can use different underlying
!   code-point sequences. When they should compare consistently, the input
!   can first be normalized to a common Unicode normalization form. If the
!   intended comparison unit is a user-perceived character, the normalized
!   text can then be segmented into extended grapheme clusters and the
!   ordinary Levenshtein recurrence applied to those sequences.
! 
! References
! 
!     
! 
! - V. I. Levenshtein, "Binary codes capable of correcting deletions,
!   insertions, and reversals", Dokl. Akad. Nauk SSSR 163(4), 845–848
!   (1965).
! - NIST Dictionary of Algorithms and Data Structures — Levenshtein
!   distance.
! - Unicode Standard Annex #15 — Unicode Normalization Forms.
! - Unicode Standard Annex #29 — Unicode Text Segmentation.
! 
! Further reading
! 
!     
! 
! - Levenshtein.net — Unicode and Grapheme-Safe Levenshtein:
!   Normalization, EGCs and Correct Text Distance.
! 
! brbr

USING: lcs prettyprint ;
"kitten" "sitting" levenshtein .
