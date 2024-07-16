! As described on the Chess960 page, Chess960 (a.k.a Fischer Random Chess,
! Chess9LX) is a variant of chess where the array of pieces behind the
! pawns is randomized at the start of the game to minimize the value of
! opening theory "book knowledge". That task is to generate legal starting
! positions, and some of the solutions accept a standard Starting Position
! Identifier number ("SP-ID"), and generate the corresponding position.
! 
! Task:
! 
! This task is to go the other way: given a starting array of pieces
! (provided in any form that suits your implementation, whether string or
! list or array, of letters or Unicode chess symbols or enum values,
! etc.), derive its unique SP-ID. For example, given the starting array
! QNRBBNKR (or ♕♘♖♗♗♘♔♖ or ♛♞♜♝♝♞♚♜), which we assume is given as seen
! from White's side of the board from left to right, your (sub)program
! should return 105; given the starting lineup of standard chess, it
! should return 518.
! 
! You may assume the input is a valid Chess960 position; detecting invalid
! input (including illegal characters or starting arrays with the bishops
! on the same color square or the king not between the two rooks) is
! optional.
! 
! Algorithm:
! 
! The derivation is the inverse of the algorithm given at Wikipedia, and
! goes like this (we'll use the standard chess setup as an example).
! 
! 1. Ignoring the Queen and Bishops, find the positions of the Knights
! within the remaining five spaces (in the standard array they're in the
! second and fourth positions), and then find the index number of that
! combination. There's a table at the above Wikipedia article, but it's
! just the possible positions sorted left to right and numbered 0 to 9:
! 0=NN---, 1=N-N--, 2=N--N-, 3=N---N, 4=-NN--, etc; our pair is
! combination number 5. Call this number N. N=5
! 
! 2. Still ignoring the Bishops, find the position of the Queen in the
! remaining 6 spaces; number them 0..5 from left to right and call the
! index of the Queen's position Q. In our example, Q=2.
! 
! 3. Finally, find the positions of the two bishops within their
! respective sets of four like-colored squares. It's important to note
! here that the board in chess is placed such that the leftmost position
! on the home row is on a dark square and the rightmost a light. So if we
! number the squares of each color 0..3 from left to right, the dark
! bishop in the standard position is on square 1 (D=1), and the light
! bishop is on square 2 (L=2).
! 
! 4. Then the position number is given by 4(4(6N + Q)+D)+L, which reduces
! to 96N + 16Q + 4D + L. In our example, that's 96×5 + 16×2 + 4×1 + 2 =
! 480 + 32 + 4 + 2 = 518.
! 
! Note that an earlier iteration of this page contained an incorrect
! description of the algorithm which would give the same SP-ID for both of
! the following two positions.
! 
!    RQNBBKRN = 601
!    RNQBBKRN = 617

USING: assocs assocs.extras combinators formatting kernel
literals math math.combinatorics sequences sequences.extras sets
strings ;

IN: scratchpad

! ====== optional error-checking ======

: check-length ( str -- )
    length 8 = [ "Must have 8 pieces." throw ] unless ;

: check-one ( str -- )
    "KQ" counts [ nip 1 = not ] assoc-find nip
    [ 1string "Must have one %s." sprintf throw ] [ drop ] if ;

: check-two ( str -- )
    "BNR" counts [ nip 2 = not ] assoc-find nip
    [ 1string "Must have two %s." sprintf throw ] [ drop ] if ;

: check-king ( str -- )
    "QBN" without "RKR" =
    [ "King must be between rooks." throw ] unless ;

: check-bishops ( str -- )
    CHAR: B swap indices sum odd?
    [ "Bishops must be on opposite colors." throw ] unless ;

: check-sp ( str -- )
    {
        [ check-length ]
        [ check-one ]
        [ check-two ]
        [ check-king ]
        [ check-bishops ]
    } cleave ;

! ====== end optional error-checking ======


CONSTANT: convert $[ "RNBQK" "♖♘♗♕♔" zip ]

CONSTANT: table $[ "NN---" all-unique-permutations ]

: knightify ( str -- newstr )
    [ dup CHAR: N = [ drop CHAR: - ] unless ] map ;

: n ( str -- n ) "QB" without knightify table index ;

: q ( str -- q ) "B" without CHAR: Q swap index ;

: d ( str -- d ) CHAR: B swap <evens> index ;

: l ( str -- l ) CHAR: B swap <odds> index ;

: sp-id ( str -- n )
    dup check-sp
    { [ n 96 * ] [ q 16 * + ] [ d 4 * + ] [ l + ] } cleave ;

: sp-id. ( str -- )
    dup [ convert substitute ] [ sp-id ] bi
    "%s / %s: %d\n" printf ;

"QNRBBNKR" sp-id.
"RNBQKBNR" sp-id.
"RQNBBKRN" sp-id.
"RNQBBKRN" sp-id.
