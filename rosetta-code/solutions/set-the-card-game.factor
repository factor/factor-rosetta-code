! [twelve Set cards] The card game, Set, is played with a pack of 81
! cards, each of which depicts either one, two, or three diamonds, ovals,
! or squiggles. The symbols are coloured red, green, or purple, and the
! shading is either solid, striped, or open. No two cards are identical.
! 
! In the game a number of cards are layed out face up and the players try
! to identify "sets" within the cards.
! 
! A set is three cards where either the symbols on the cards are all the
! same or they are all different, the number of symbols on the cards are
! all the same or all different, the colours are all the same or all
! different, and the shadings are all the same or all different.
! 
! For example, this is a set:
! 
!     two solid green ovals
!     one open green squiggle
!     three striped green diamonds
! 
! because each card depicts a different symbol, the number of symbols on
! each card is different, the colours are all the same, and the shadings
! are all different.
! 
! This is not a set:
! 
!     two solid purple ovals
!     one open green squiggle
!     three striped green diamonds
! 
! because two of the cards are green and one is purple, so the colours are
! neither all the same nor all different.
! 
! task:
! 
! -   -   Create a representation of a pack of Set cards, shuffle it,
!         select a specified number of cards from the pack and list them
!         in the output.
! 
! -   -   Identify the sets in the selected cards and list them.
! 
! Also see:
! 
! -   -   The Wikipedia article, Set (card game)

USING: grouping io kernel literals math.combinatorics
prettyprint qw random sequences sequences.product sets ;

CONSTANT: cards $[
    qw{
        one two three
        solid open striped
        red green purple
        diamond oval squiggle
    } 3 group <product-sequence>
]

: deal ( n -- seq ) cards swap sample ;

: set? ( seq -- ? ) cardinality { 1 3 } member? ;

: sets ( seq -- newseq )
    3 [ flip [ set? ] all? ] filter-combinations ;

: .length ( seq str -- ) write bl length . nl ;

: .cards ( seq -- )
    [ " " join dup "o" head? "" "s" ? append print ] each nl ;

: .sets ( seq -- )
    dup "Sets present:" .length [ .cards ] each ;

: play ( n -- )
    deal [ "Cards dealt:" .length ]
         [ .cards ]
         [ sets .sets ] tri ;

4 8 12 [ play ] tri@
