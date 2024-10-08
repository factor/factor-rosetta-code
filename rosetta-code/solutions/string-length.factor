! Task:
! 
! Find the character and byte length of a string.
! 
! This means encodings like UTF-8 need to be handled properly, as there is
! not necessarily a one-to-one relationship between bytes and characters.
! 
! By character, we mean an individual Unicode code point, not a
! user-visible grapheme containing combining characters.
! 
! For example, the character length of "møøse" is 5 but the byte length is
! 7 in UTF-8 and 10 in UTF-16.
! 
! Non-BMP code points (those between 0x10000 and 0x10FFFF) must also be
! handled correctly: answers should produce actual character counts in
! code points, not in code unit counts.
! 
! Therefore a string like "𝔘𝔫𝔦𝔠𝔬𝔡𝔢" (consisting of the 7 Unicode
! characters U+1D518 U+1D52B U+1D526 U+1D520 U+1D52C U+1D521 U+1D522) is 7
! characters long, not 14 UTF-16 code units; and it is 28 bytes long
! whether encoded in UTF-8 or in UTF-16.
! 
! Please mark your examples with ===Character Length=== or ===Byte
! Length===.
! 
! If your language is capable of providing the string length in graphemes,
! mark those examples with ===Grapheme Length===.
! 
! For example, the string "J̲o̲s̲é̲"
! ("J\x{332}o\x{332}s\x{332}e\x{301}\x{332}") has 4 user-visible
! graphemes, 9 characters (code points), and 14 bytes when encoded in
! UTF-8.
! 
! Category: String manipulation

: string-byte-length ( string -- n ) [ code-point-length ] map-sum ;
: string-byte-length-2 ( string -- n ) utf8 encode length ;
