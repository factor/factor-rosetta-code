! Determine if a character string is squeezable.
! 
! And if so, squeeze the string (by removing any number of a specified
! immediately repeated character).
! 
! This task is very similar to the task Determine if a character string is
! collapsible except that only a specified character is squeezed instead
! of any character that is immediately repeated.
! 
! If a character string has a specified immediately repeated character(s),
! the repeated characters are to be deleted (removed), but not the primary
! (1^(st)) character(s).
! 
! A specified immediately repeated character is any specified character
! that is immediately   followed by an identical character (or
! characters). Another word choice could've been duplicated character, but
! that might have ruled out (to some readers) triplicated characters ···
! or more.
! 
! {This Rosetta Code task was inspired by a newly introduced (as of around
! November 2019) PL/I BIF: squeeze.}
! 
! Examples:
! 
! In the following character string with a specified immediately repeated
! character of e:
! 
!  The better the 4-wheel drive, the further you'll be from help when ya get stuck! 
! 
! Only the 2^(nd) e is an specified repeated character, indicated by an
! underscore (above), even though they (the characters) appear elsewhere
! in the character string.
! 
! So, after squeezing the string, the result would be:
! 
!  The better the 4-whel drive, the further you'll be from help when ya get stuck! 
! 
! Another example: In the following character string, using a specified
! immediately repeated character s:
! 
!  headmistressship 
! 
! The "squeezed" string would be:
! 
!  headmistreship 
! 
! Task:
! 
! Write a subroutine/function/procedure/routine··· to locate a specified
! immediately repeated character and squeeze (delete) them from the
! character string. The character string can be processed from either
! direction.
! 
! Show all output here, on this page:
! 
! -   -   the specified repeated character (to be searched for and
!         possibly squeezed):
!     -   the original string and its length
!     -   the resultant string and its length
!     -   the above strings should be "bracketed" with <<< and >>> (to
!         delineate blanks)
! 
! * «««Guillemets may be used instead for "bracketing" for the more artistic programmers, shown used here»»»
! 
! Use (at least) the following five strings, all strings are length
! seventy-two (characters, including blanks), except the 1^(st) string:
! 
!                                                                                   immediately
!  string                                                                            repeated
!  number                                                                            character
!                                                                                      ( ↓   a blank,  a minus,  a seven,  a period)
!         ╔╗
!    1    ║╚═══════════════════════════════════════════════════════════════════════╗    ' '    ◄■■■■■■  a null string  (length zero)
!    2    ║"If I were two-faced, would I be wearing this one?" --- Abraham Lincoln ║    '-'
!    3    ║..1111111111111111111111111111111111111111111111111111111111111117777888║    '7'
!    4    ║I never give 'em hell, I just tell the truth, and they think it's hell. ║    '.'
!    5    ║                                                    --- Harry S Truman  ║  (below)  ◄■■■■■■  has many repeated blanks
!         ╚════════════════════════════════════════════════════════════════════════╝     ↑
!                                                                                        │
!                                                                                        │
!         For the 5^(th) string  (Truman's signature line),  use each of these  specified immediately  repeated characters:
!                                   •  a blank
!                                   •  a minus
!                                   •  a lowercase  r
! 
! Note: there should be seven results shown, one each for the 1^(st) four
! strings, and three results for the 5^(th) string.

USING: formatting fry io kernel math sbufs sequences strings ;
IN: rosetta-code.squeeze

: (squeeze) ( str c -- new-str )
    [ unclip-slice 1string >sbuf ] dip
    '[ over last over [ _ = ] both? [ drop ] [ suffix! ] if ]
    reduce >string ;

: squeeze ( str c -- new-str )
    over empty? [ 2drop "" ] [ (squeeze) ] if ;

: .str ( str -- ) dup length "«««%s»»» (length %d)\n" printf ;
 
: show-squeeze ( str c -- )
    dup "Specified character: '%c'\n" printf
    [ "Before squeeze: " write drop .str ]
    [ "After  squeeze: " write squeeze .str ] 2bi nl ;

: squeeze-demo ( -- )
    {
        ""
        "\"If I were two-faced, would I be wearing this one?\" --- Abraham Lincoln "
        "..1111111111111111111111111111111111111111111111111111111111111117777888"
        "I never give 'em hell, I just tell the truth, and they think it's hell. "
    } "\0-7." [ show-squeeze ] 2each

    "                                                   ---  Harry S Truman  "
    [ CHAR: space ] [ CHAR: - ] [ CHAR: r ] tri
    [ show-squeeze ] 2tri@ ;
 
MAIN: squeeze-demo
