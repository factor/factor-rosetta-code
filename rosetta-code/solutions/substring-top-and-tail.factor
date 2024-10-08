! The task is to demonstrate how to remove the first and last characters
! from a string.
! 
! The solution should demonstrate how to obtain the following results:
! 
! -   String with first character removed
! -   String with last character removed
! -   String with both the first and last characters removed
! 
! If the program uses UTF-8 or UTF-16, it must work on any valid Unicode
! code point, whether in the Basic Multilingual Plane or above it.
! 
! The program must reference logical characters (code points), not 8-bit
! code units for UTF-8 or 16-bit code units for UTF-16.
! 
! Programs for other encodings (such as 8-bit ASCII, or EUC-JP) are not
! required to handle all Unicode characters.
! 
! Category:String manipulation

USING: io kernel sequences ;
"Rosetta code" [ rest ] [ but-last ] [ rest but-last ] tri
[ print ] tri@
