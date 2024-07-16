! Cistercian numerals were used across Europe by Cistercian monks during
! the Late Medieval Period as an alternative to Roman numerals. They were
! used to represent base 10 integers from 0 to 9999.
! 
! How they work
! 
! All Cistercian numerals begin with a vertical line segment, which by
! itself represents the number 0. Then, glyphs representing the digits 1
! through 9 are optionally added to the four quadrants surrounding the
! vertical line segment. These glyphs are drawn with vertical and
! horizontal symmetry about the initial line segment. Each quadrant
! corresponds to a digit place in the number:
! 
! -   -   The upper-right quadrant represents the ones place.
!     -   The upper-left quadrant represents the tens place.
!     -   The lower-right quadrant represents the hundreds place.
!     -   The lower-left quadrant represents the thousands place.
! 
! Please consult the following image for examples of Cistercian numerals
! showing each glyph: 1
! 
! Task
! 
! -   -   Write a function/procedure/routine to display any given
!         Cistercian numeral. This could be done by drawing to the
!         display, creating an image, or even as text (as long as it is a
!         reasonable facsimile).
! 
! -   -   Use the routine to show the following Cistercian numerals:
! 
! -   -   0
!     -   1
!     -   20
!     -   300
!     -   4000
!     -   5555
!     -   6789
!     -   And a number of your choice!
! 
! Notes
! 
! Due to the inability to upload images to Rosetta Code as of this task's
! creation, showing output here on this page is not required. However, it
! is welcomed — especially for text output.
! 
! See also
! 
! -   -   Numberphile - The Forgotten Number System
!     -   dcode.fr - Online Cistercian numeral converter

USING: combinators continuations formatting grouping io kernel
literals math.order math.text.utils multiline sequences
splitting ;

CONSTANT: numerals $[
HEREDOC: END
  +    +-+  +    +    + +  +-+  + +  +-+  + +  +-+
  |    |    |    |\   |/   |/   | |  | |  | |  | |
  |    |    +-+  | +  +    +    | +  | +  +-+  +-+
  |    |    |    |    |    |    |    |    |    |  
  |    |    |    |    |    |    |    |    |    |  
  |    |    |    |    |    |    |    |    |    |  
  +    +    +    +    +    +    +    +    +    +  
END
"\n" split harvest [ 5 group ] map flip
]

: precedence ( char char -- char )
    2dup [ CHAR: + = ] either? [ 2drop CHAR: + ] [ max ] if ;

: overwrite ( glyph glyph -- newglyph )
    [ [ precedence ] 2map ] 2map ;

: flip-slashes ( str -- new-str )
    [
        {
            { CHAR: / [ CHAR: \ ] }
            { CHAR: \ [ CHAR: / ] }
            [ ]
        } case
    ] map ;

: hflip ( seq -- newseq ) [ reverse flip-slashes ] map ;
: vflip ( seq -- newseq ) reverse [ flip-slashes ] map ;

: get-digits ( n -- seq ) 1 digit-groups 4 0 pad-tail ;

: check-cistercian ( n -- )
    0 9999 between? [ "Must be from 0 to 9999." throw ] unless ;

: .cistercian ( n -- )
    [ check-cistercian ] [ "%d:\n" printf ] [ get-digits ] tri
    [ numerals nth ] map
    [ { [ ] [ hflip ] [ vflip ] [ hflip vflip ] } spread ]
    with-datastack [ ] [ overwrite ] map-reduce [ print ] each ;

{ 0 1 20 300 4000 5555 6789 8015 } [ .cistercian nl ] each
