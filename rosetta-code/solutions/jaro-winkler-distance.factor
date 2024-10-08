! The Jaro-Winkler distance is a metric for measuring the edit distance
! between words. It is similar to the more basic Levenshtein distance but
! the Jaro distance also accounts for transpositions between letters in
! the words. With the Winkler modification to the Jaro metric, the
! Jaro-Winkler distance also adds an increase in similarity for words
! which start with the same letters (prefix).
! 
! The Jaro-Winkler distance is a modification of the Jaro similarity
! metric, which measures the similarity between two strings. The Jaro
! similarity is 1.0 when strings are identical and 0 when strings have no
! letters in common. Distance measures such as the Jaro distance or
! Jaro-Winkler distance, on the other hand, are 0 when strings are
! identical and 1 when they have no letters in common.
! 
! The Jaro similarity between two strings s1 and s2, sim_(j), is defined
! as
! 
!     sim_(j) = 0 if m is 0.
!     sim_(j) = ( (m / length of s1) + (m / length of s2) + (m - t) / m )
!     / 3 otherwise.
! 
! Where:
! 
! -   m is the number of matching characters (the same character within
!     max(|s1|, |s2|)/2 - 1 of one another);
! -   t is half the number of transpositions (a shared character placed in
!     different positions).
! 
! The Winkler modification to Jaro is to check for identical prefixes of
! the strings.
! 
! If we define the number of initial (prefix) characters in common as:
! 
! l = the length of a common prefix between strings, up to 4 characters
! 
! and, additionally, select a multiplier (Winkler suggested 0.1) for the
! relative importance of the prefix for the word similarity:
! 
! p = 0.1
! 
! The Jaro-Winkler similarity can then be defined as
! 
! sim_(w) = sim_(j) + lp(1 - sim_(j))
! 
! Where:
! 
! -   sim_(j) is the Jaro similarity.
! -   l is the number of matching characters at the beginning of the
!     strings, up to 4.
! -   p is a factor to modify the amount to which the prefix similarity
!     affects the metric.
! 
! Winkler suggested this be 0.1.
! The Jaro-Winkler distance between strings, which is 0.0 for identical
! strings, is then defined as
! 
! d_(w) = 1 - sim_(w)
! 
! String metrics such as Jaro-Winkler distance are useful in applications
! such as spelling checkers, because letter transpositions are common
! typing errors and humans tend to misspell the middle portions of words
! more often than their beginnings. This may help a spelling checker
! program to generate better alternatives for misspelled word replacement.
! 
! The task:
! 
! Using a dictionary of your choice and the following list of 9 commonly
! misspelled words:
! 
! "accomodate", "definately", "goverment​", "occured", "publically",
! "recieve​", "seperate", "untill", "wich​"
! 
! -   Calculate the Jaro-Winkler distance between the misspelled word and
!     words in the dictionary.
! 
! -   Use this distance to list close alternatives (at least two per word)
!     to the misspelled words.
! 
! -   Show the calculated distances between the misspelled words and their
!     potential replacements.
! 
! See also
! 
! -   -   Wikipedia page: Jaro–Winkler distance.
!     -   Comparing string similarity algorithms. Comparison of algorithms
!         on Medium


