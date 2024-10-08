! As described in UTF-8 and in Wikipedia, UTF-8 is a popular encoding of
! (multi-byte) Unicode code-points into eight-bit octets.
! 
! The goal of this task is to write a encoder that takes a unicode
! code-point (an integer representing a unicode character) and returns a
! sequence of 1–4 bytes representing that character in the UTF-8 encoding.
! 
! Then you have to write the corresponding decoder that takes a sequence
! of 1–4 UTF-8 encoded bytes and return the corresponding unicode
! character.
! 
! Demonstrate the functionality of your encoder and decoder on the
! following five characters:
! 
!     Character   Name                                  Unicode    UTF-8 encoding (hex)
!     ---------------------------------------------------------------------------------
!     A           LATIN CAPITAL LETTER A                U+0041     41
!     ö           LATIN SMALL LETTER O WITH DIAERESIS   U+00F6     C3 B6
!     Ж           CYRILLIC CAPITAL LETTER ZHE           U+0416     D0 96
!     €           EURO SIGN                             U+20AC     E2 82 AC
!     𝄞           MUSICAL SYMBOL G CLEF                 U+1D11E    F0 9D 84 9E
! 
! Provided below is a reference implementation in Common Lisp.


