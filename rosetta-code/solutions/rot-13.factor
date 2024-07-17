! Task:
! 
! Implement a rot-13 function (or procedure, class, subroutine, or other
! "callable" object as appropriate to your programming environment).
! 
! Optionally wrap this function in a utility program (like tr, which acts
! like a common UNIX utility, performing a line-by-line rot-13 encoding of
! every line of input contained in each file listed on its command line,
! or (if no filenames are passed thereon) acting as a filter on its
! "standard input."
! 
! (A number of UNIX scripting languages and utilities, such as awk and sed
! either default to processing files in this way or have command line
! switches or modules to easily implement these wrapper semantics, e.g.,
! Perl and Python).
! 
! The rot-13 encoding is commonly known from the early days of Usenet
! "Netnews" as a way of obfuscating text to prevent casual reading of
! spoiler or potentially offensive material.
! 
! Many news reader and mail user agent programs have built-in rot-13
! encoder/decoders or have the ability to feed a message through any
! external utility script for performing this (or other) actions.
! 
! The definition of the rot-13 function is to simply replace every letter
! of the ASCII alphabet with the letter which is "rotated" 13 characters
! "around" the 26 letter alphabet from its normal cardinal position
! (wrapping around from z to a as necessary).
! 
! Thus the letters abc become nop and so on.
! 
! Technically rot-13 is a "mono-alphabetic substitution cipher" with a
! trivial "key".
! 
! A proper implementation should work on upper and lower case letters,
! preserve case, and pass all non-alphabetic characters in the input
! stream through without alteration.
! 
! Related tasks:
! 
! -   Caesar cipher
! -   Substitution Cipher
! -   Vigenère Cipher/Cryptanalysis
! 
! Category:String_manipulation

#! /usr/bin/env factor

USING: kernel io ascii math combinators sequences ;
IN: rot13

: rot-base ( ch ch -- ch ) [ - 13 + 26 mod ] keep + ;

: rot13-ch ( ch -- ch )
    {
        { [ dup letter? ] [ CHAR: a rot-base ] }
        { [ dup LETTER? ] [ CHAR: A rot-base ] }
        [ ]
    }
    cond ;

: rot13 ( str -- str ) [ rot13-ch ] map ;

: main ( -- )
    [ readln dup ]
    [ rot13 print flush ]
    while
    drop ;

MAIN: main
