! The Levenshtein distance algorithm returns the number of atomic
! operations (insertion, deletion or edition) that must be performed on a
! string in order to obtain an other one, but it does not say anything
! about the actual operations used or their order.
! 
! An alignment is a notation used to describe the operations used to turn
! a string into an other. At some point in the strings, the minus
! character ('-') is placed in order to signify that a character must be
! added at this very place. For instance, an alignment between the words
! 'place' and 'palace' is:
! 
!     P-LACE
!     PALACE
! 
! Task:
! 
! Write a function that shows the alignment of two strings for the
! corresponding levenshtein distance.
! 
! As an example, use the words "rosettacode" and "raisethysword".
! 
! You can either implement an algorithm, or use a dedicated library (thus
! showing us how it is named in your language).


