! Determine if a character string is collapsible.
! 
! And if so, collapse the string (by removing immediately repeated
! characters).
! 
! If a character string has immediately repeated character(s), the
! repeated characters are to be deleted (removed), but not the primary
! (1^(st)) character(s).
! 
! An immediately repeated character is any character that is immediately
! followed by an identical character (or characters). Another word choice
! could've been duplicated character, but that might have ruled out (to
! some readers) triplicated characters ··· or more.
! 
! {This Rosetta Code task was inspired by a newly introduced (as of around
! November 2019) PL/I BIF: collapse.}
! 
! Examples:
! 
! In the following character string:
! 
!  The better the 4-wheel drive, the further you'll be from help when ya get stuck! 
! 
! Only the 2^(nd) t, e, and l are repeated characters, indicated by
! underscores (above), even though they (those characters) appear
! elsewhere in the character string.
! 
! So, after collapsing the string, the result would be:
! 
!  The beter the 4-whel drive, the further you'l be from help when ya get stuck! 
! 
! Another example: In the following character string:
! 
!  headmistressship 
! 
! The "collapsed" string would be:
! 
!  headmistreship 
! 
! Task:
! 
! Write a subroutine/function/procedure/routine··· to locate repeated
! characters and collapse (delete) them from the character string. The
! character string can be processed from either direction.
! 
! Show all output here, on this page:
! 
! -   -   the original string and its length
!     -   the resultant string and its length
!     -   the above strings should be "bracketed" with <<< and >>> (to
!         delineate blanks)
! 
! * «««Guillemets may be used instead for "bracketing" for the more artistic programmers, shown used here»»»
! 
! Use (at least) the following five strings, all strings are length
! seventy-two (characters, including blanks), except the 1^(st) string:
! 
!  string
!  number
!         ╔╗
!    1    ║╚═══════════════════════════════════════════════════════════════════════╗   ◄■■■■■■  a null string  (length zero)
!    2    ║"If I were two-faced, would I be wearing this one?" --- Abraham Lincoln ║
!    3    ║..1111111111111111111111111111111111111111111111111111111111111117777888║
!    4    ║I never give 'em hell, I just tell the truth, and they think it's hell. ║
!    5    ║                                                    --- Harry S Truman  ║   ◄■■■■■■  has many repeated blanks
!         ╚════════════════════════════════════════════════════════════════════════╝

USING: formatting io kernel sbufs sequences strings ;
IN: rosetta-code.string-collapse

: (collapse) ( str -- str )
    unclip-slice 1string >sbuf
    [ over last over = [ drop ] [ suffix! ] if ] reduce >string ;

: collapse ( str -- str ) [ "" ] [ (collapse) ] if-empty ;

: .str ( str -- ) dup length "«««%s»»» (length %d)\n" printf ;

: show-collapse ( str -- )
    [ "Before collapse: " write .str ]
    [ "After  collapse: " write collapse .str ] bi nl ;

: collapse-demo ( -- )
    {
        ""
        "\"If I were two-faced, would I be wearing this one?\" --- Abraham Lincoln "
        "..1111111111111111111111111111111111111111111111111111111111111117777888"
        "I never give 'em hell, I just tell the truth, and they think it's hell. "
        "                                                   ---  Harry S Truman  "
        "The better the 4-wheel drive, the further you'll be from help when ya get stuck!"
        "headmistressship"
        "aardvark"
        "😍😀🙌💃😍😍😍🙌"
    } [ show-collapse ] each ;

MAIN: collapse-demo
