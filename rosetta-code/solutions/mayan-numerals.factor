! Task:
! 
! Present numbers using the Mayan numbering system (displaying the Mayan
! numerals in a cartouche).
! 
! Mayan numbers:
! 
! Normally, Mayan numbers are written vertically (top─to─bottom) with the
! most significant numeral at the top (in the sense that decimal numbers
! are written left─to─right with the most significant digit at the left).
! This task will be using a left─to─right (horizontal) format, mostly for
! familiarity and readability, and to conserve screen space (when showing
! the output) on this task page.
! 
! Mayan numerals:
! 
! Mayan numerals (a base─20 "digit" or glyph) are written in two
! orientations, this task will be using the "vertical" format (as
! displayed below). Using the vertical format makes it much easier to
! draw/construct the Mayan numerals (glyphs) with simple dots (.) and
! hyphen (-); (however, round bullets (•) and long dashes (─) make a
! better presentation on Rosetta Code).
! 
! Furthermore, each Mayan numeral (for this task) is to be displayed as a
! cartouche (enclosed in a box) to make it easier to parse (read); the box
! may be drawn with any suitable (ASCII or Unicode) characters that are
! presentable/visible in all web browsers.
! 
! Mayan numerals added to Unicode
! 
! Mayan numerals (glyphs) were added to the Unicode Standard in June of
! 2018 (this corresponds with version 11.0). But since most web browsers
! don't support them at this time, this Rosetta Code task will be
! constructing the glyphs with "simple" characters and/or ASCII art.
! 
! The "zero" glyph:
! 
! The Mayan numbering system has the concept of zero, and should be shown
! by a glyph that represents an upside─down (sea) shell, or an egg. The
! Greek letter theta (Θ) can be used (which more─or─less, looks like an
! egg). A commercial at symbol (@) could make a poor substitute.
! 
! Mayan glyphs (constructed):
! 
! The Mayan numbering system is a https://en.wikipedia.org/wiki/Vigesimal
! vigesimal (base 20) positional numeral system.
! 
! The Mayan numerals (and some random numbers) shown in the vertical format would be shown as:
! 
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║    ║                            ║    ║    ║
!       ║    ║                      ║ ∙  ║                            ║    ║    ║
!  1──► ║    ║                11──► ║────║                      21──► ║    ║    ║
!       ║ ∙  ║                      ║────║                            ║ ∙  ║ ∙  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║    ║                            ║    ║    ║
!       ║    ║                      ║ ∙∙ ║                            ║    ║    ║
!  2──► ║    ║                12──► ║────║                      22──► ║    ║    ║
!       ║ ∙∙ ║                      ║────║                            ║ ∙  ║ ∙∙ ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║    ║                            ║    ║    ║
!       ║    ║                      ║∙∙∙ ║                            ║    ║    ║
!  3──► ║    ║                13──► ║────║                      40──► ║    ║    ║
!       ║∙∙∙ ║                      ║────║                            ║ ∙∙ ║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║    ║                            ║    ║    ║
!       ║    ║                      ║∙∙∙∙║                            ║    ║    ║
!  4──► ║    ║                14──► ║────║                      80──► ║    ║    ║
!       ║∙∙∙∙║                      ║────║                            ║∙∙∙∙║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║    ║                            ║    ║    ║
!       ║    ║                      ║────║                            ║    ║    ║
!  5──► ║    ║                15──► ║────║                      90──► ║    ║────║
!       ║────║                      ║────║                            ║∙∙∙∙║────║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║ ∙  ║                            ║    ║    ║
!       ║    ║                      ║────║                            ║    ║    ║
!  6──► ║ ∙  ║                16──► ║────║                     100──► ║    ║    ║
!       ║────║                      ║────║                            ║────║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║ ∙∙ ║                            ║    ║    ║
!       ║    ║                      ║────║                            ║    ║    ║
!  7──► ║ ∙∙ ║                17──► ║────║                     200──► ║────║    ║
!       ║────║                      ║────║                            ║────║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╗
!       ║    ║                      ║∙∙∙ ║                            ║    ║    ║
!       ║    ║                      ║────║                     300──► ║────║    ║
!  8──► ║∙∙∙ ║                18──► ║────║                            ║────║    ║
!       ║────║                      ║────║                            ║────║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╝
!       ╔════╗                      ╔════╗                            ╔════╦════╦════╗
!       ║    ║                      ║∙∙∙∙║                            ║    ║    ║    ║
!       ║    ║                      ║────║                     400──► ║    ║    ║    ║
!  9──► ║∙∙∙∙║                19──► ║────║                            ║    ║    ║    ║
!       ║────║                      ║────║                            ║ ∙  ║ Θ  ║ Θ  ║
!       ╚════╝                      ╚════╝                            ╚════╩════╩════╝
!       ╔════╗                      ╔════╦════╗                       ╔════╦════╦════╦════╗
!       ║    ║                      ║    ║    ║                       ║    ║    ║    ║    ║
!       ║    ║                      ║    ║    ║                       ║    ║    ║    ║    ║
! 10──► ║────║                20──► ║    ║    ║             16,000──► ║    ║    ║    ║    ║
!       ║────║                      ║ ∙  ║ Θ  ║                       ║ ∙∙ ║ Θ  ║ Θ  ║ Θ  ║
!       ╚════╝                      ╚════╩════╝                       ╚════╩════╩════╩════╝
! 
! Note that the Mayan numeral 13 in horizontal format would be shown as:
! 
!                                   ╔════╗
!                                   ║  ││║
!                                   ║ ∙││║
!                             13──► ║ ∙││║        ◄─── this glyph form won't be used in this Rosetta Code task.
!                                   ║ ∙││║
!                                   ╚════╝
! 
! Other forms of cartouches (boxes) can be used for this task.
! 
! Task requirements:
! 
! -   -   convert the following decimal numbers to Mayan numbers:
!         -   -   4,005
!             -   8,017
!             -   326,205
!             -   886,205
!     -   show a unique
!         interesting/pretty/unusual/intriguing/odd/amusing/weird Mayan
!         number
!     -   show all output here
! 
! Related tasks:
! 
! -   -   Roman numerals/Encode ─── convert numeric values into Roman
!         numerals
!     -   Roman numerals/Decode ─── convert Roman numerals into Arabic
!         numbers
! 
! See also:
! 
! -   -   The Wikipedia entry: https://en.wikipedia.org/wiki/Maya_numerals
!         Mayan numerals

USING: arrays formatting io kernel make math math.extras
sequences ;
IN: rosetta-code.mayan-numerals

: mayan-digit ( n -- m pair ) 20 /mod 5 /mod swap 2array ;

: integer>mayan ( n -- seq )
    [ [ mayan-digit , ] until-zero ] { } make reverse ;

: ones ( n -- str ) [ CHAR: ● ] "" replicate-as ;
: fives ( n -- str ) [ "——" ] replicate "<br>" join ;

: numeral ( pair -- str )
    dup sum zero? [ drop "Θ" ]
    [ first2 [ ones ] [ fives ] bi* 2array harvest "<br>" join ]
    if ;

: .table-row ( pair -- )
    "|style=\"width:3em;vertical-align:bottom;\"|" write numeral
    print ;

: .table-head ( -- )
    "class=\"wikitable\" style=\"text-align:center;\"" print ;

: .table-body ( n -- ) integer>mayan [ .table-row ] each ;

: .mayan ( n -- )
    [ "Mayan %d:\n" printf ]
    [ "{|" write .table-head .table-body "|}" print ] bi ;

: mayan-numerals ( -- )
    { 4005 8017 326205 886205 } [ .mayan ] each ;

MAIN: mayan-numerals
