! It is common to have a string containing a number written in some
! format, with the most common ones being decimal, hexadecimal, octal and
! binary. Such strings are found in many places (user interfaces,
! configuration files, XML data, network protocols, etc.)
! 
! This task requires parsing of such a string (which may be assumed to
! contain nothing else) using the language's built-in facilities if
! possible. Parsing of decimal strings is required, parsing of other
! formats is optional but should be shown (i.e., if the language can parse
! in base-19 then that should be illustrated).
! 
! The solutions may assume that the base of the number in the string is
! known. In particular, if your language has a facility to guess the base
! of a number by looking at a prefix (e.g. "0x" for hexadecimal) or other
! distinguishing syntax as it parses it, please show that.
! 
! The reverse operation is in task Non-decimal radices/Output
! 
! For general number base conversion, see Non-decimal radices/Convert.

IN: math.parser
: oct> ( str -- n/f ) 8 base> ; inline
