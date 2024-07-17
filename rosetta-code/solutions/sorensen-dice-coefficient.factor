! The Sørensen–Dice coefficient, also known as the Sørensen–Dice index (or
! sdi, or sometimes by one of the individual names: sorensen or dice) is a
! statistic used to gauge the similarity of two population samples.
! 
! The original use was in botany as a measure of similarity between
! populations of flora and fauna in different areas, but it has uses in
! other fields as well. It can be used as a text similarity function
! somewhat similar to the Levenshtein edit distance function, though its
! characteristics are quite different.
! 
! Levenshtein can be useful for spelling correction, but relies on the
! tested word or phrase being quite similar to the desired one, and can be
! very slow for long words or phrases.
! 
! Sørensen–Dice is more useful for 'fuzzy' matching partial and poorly
! spelled words or phrases, possibly in improper order.
! 
! There are several different methods to tokenize objects for
! Sørensen–Dice comparisons. The most typical tokenizing scheme for text
! is to break the words up into bi-grams: groups of two consecutive
! letters.
! 
! For instance, the word 'differ' would be tokenized to the group:
! 
!    di if ff fe er
! 
! Different implementations may do slightly different transforms. For our
! purposes, fold case so that all characters are the same case, split
! words, and ignore white-space, but keep punctuation.
! 
! The phrase "Don't Panic!" will be tokenized to the bi-grams:
! 
!    do on n' 't pa an ni ic c! 
! 
! Sørensen–Dice measures the similarity of two groups by dividing twice
! the intersection token count by the total token count of both groups:
! 
!    SDC = 2 × |A∩B| / (|A| + |B|)
! 
! where A, B and A∩B are to be understood as multisets, and that if an
! item, x, has multiplicity a in A and b in B, then it will have
! multiplicity min(a,b) in A∩B.
! 
! The Sørensen–Dice coefficient is thus a ratio between 0.0 and 1.0 giving
! the "percent similarity" between the two populations.
! 
! SDC can by used for spellchecking, but it's not really good at it,
! especially for short words. Where it really shines is for fuzzy matching
! of short phrases like book or movie titles. It may not return exactly
! what you are looking for, but often gets remarkably close with some
! pretty poor inputs.
! 
! Task
! 
! -   Use the list of Rosetta Code task and draft task names as your
!     "dictionary" to search.
! -   Using that dictionary, search for the mangled task names:
!     'Primordial primes', 'Sunkist-Giuliani formula', 'Sieve of
!     Euripides', 'Chowder numbers'.
! -   Show the search term and the coefficient / match for the five
!     closest, most similar matches.
! 
! How you get the task names is peripheral to the task. You can web-scrape
! them or download them to a file, whatever.
! 
! If there is a built-in or easily, freely available library
! implementation for Sørensen–Dice coefficient calculations, it is
! acceptable to use that with a pointer to where it may be obtained.


