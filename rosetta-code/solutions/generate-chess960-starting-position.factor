! Chess960 is a variant of chess created by world champion Bobby Fischer.
! Unlike other variants of the game, Chess960 does not require a different
! material, but instead relies on a random initial position, with a few
! constraints:
! 
! -   as in the standard chess game, all eight white pawns must be placed
!     on the second rank.
! -   White pieces must stand on the first rank as in the standard game,
!     in random column order but with the two following constraints:
!     -   the bishops must be placed on opposite color squares (i.e. they
!         must be an odd number of spaces apart or there must be an even
!         number of spaces between them)
!     -   the King must be between two rooks (with any number of other
!         pieces between them all)
! -   Black pawns and pieces must be placed respectively on the seventh
!     and eighth ranks, mirroring the white pawns and pieces, just as in
!     the standard game. (That is, their positions are not independently
!     randomized.)
! 
! With those constraints there are 960 possible starting positions, thus
! the name of the variant.
! 
! Task:
! 
! The purpose of this task is to write a program that can randomly
! generate any one of the 960 Chess960 initial positions. You will show
! the result as the first rank displayed using either the chess symbols in
! Unicode (♔♕♖♗♘), the letters King Queen Rook Bishop kNight, or the
! corresponding letters in a language other than English.

USING: io kernel math random sequences ;
IN: rosetta-code.chess960

: empty ( seq -- n ) 32 swap indices random ;           ! return a random empty index (i.e. equal to 32) of seq
: next ( seq -- n ) 32 swap index ;                     ! return the leftmost empty index of seq
: place ( seq elt n -- seq' ) rot [ set-nth ] keep ;    ! set nth member of seq to elt, keeping seq on the stack

: white-bishop ( -- elt n ) CHAR: ♗ 4 random 2 * ;
: black-bishop ( -- elt n ) white-bishop 1 + ;
: queen ( seq -- seq elt n ) CHAR: ♕ over empty ;
: knight ( seq -- seq elt n ) CHAR: ♘ over empty ;
: rook ( seq -- seq elt n ) CHAR: ♖ over next ;
: king ( seq -- seq elt n ) CHAR: ♔ over next ;

: chess960 ( -- str )
    "        " clone
    black-bishop place
    white-bishop place
    queen place
    knight place
    knight place
    rook place
    king place
    rook place ;

: chess960-demo ( -- ) 5 [ chess960 print ] times ;

MAIN: chess960-demo
