! Set Puzzles are created with a deck of cards from the Set Game™. The
! object of the puzzle is to find sets of 3 cards in a rectangle of cards
! that have been dealt face up.
! 
! There are 81 cards in a deck. Each card contains a unique variation of
! the following four features: color, symbol, number and shading.
! 
! -   there are three colors:
! 
!    red, green, purple
! 
! -   there are three symbols:
! 
!    oval, squiggle, diamond
! 
! -   there is a number of symbols on the card:
! 
!    one, two, three
! 
! -   there are three shadings:
! 
!    solid, open, striped
! 
! Three cards form a set if each feature is either the same on each card,
! or is different on each card. For instance: all 3 cards are red, all 3
! cards have a different symbol, all 3 cards have a different number of
! symbols, all 3 cards are striped.
! 
! There are two degrees of difficulty: basic and advanced. The basic mode
! deals 9 cards, that contain exactly 4 sets; the advanced mode deals 12
! cards that contain exactly 6 sets.
! 
! When creating sets you may use the same card more than once.
! 
! Task
! 
! Write code that deals the cards (9 or 12, depending on selected mode)
! from a shuffled deck in which the total number of sets that could be
! found is 4 (or 6, respectively); and print the contents of the cards and
! the sets.
! 
! For instance:
! 
! DEALT 9 CARDS:
! 
!     green, one, oval, striped
! 
!     green, one, diamond, open
! 
!     green, one, diamond, striped
! 
!     green, one, diamond, solid
! 
!     purple, one, diamond, open
! 
!     purple, two, squiggle, open
! 
!     purple, three, oval, open
! 
!     red, three, oval, open
! 
!     red, three, diamond, solid
! 
! CONTAINING 4 SETS:
! 
!     green, one, oval, striped
! 
!     purple, two, squiggle, open
! 
!     red, three, diamond, solid
! 
!     green, one, diamond, open
! 
!     green, one, diamond, striped
! 
!     green, one, diamond, solid
! 
!     green, one, diamond, open
! 
!     purple, two, squiggle, open
! 
!     red, three, oval, open
! 
!     purple, one, diamond, open
! 
!     purple, two, squiggle, open
! 
!     purple, three, oval, open

USING: arrays backtrack combinators.short-circuit formatting
fry grouping io kernel literals math.combinatorics math.matrices
prettyprint qw random sequences sets ;
IN: rosetta-code.set-puzzle

CONSTANT: deck $[
    [
        qw{ red green purple } amb-lazy
        qw{ one two three } amb-lazy
        qw{ oval squiggle diamond } amb-lazy
        qw{ solid open striped } amb-lazy 4array
    ] bag-of
]

: valid-category? ( seq -- ? )
    { [ all-equal? ] [ all-unique? ] } 1|| ;

: valid-set? ( seq -- ? )
    [ valid-category? ] column-map t [ and ] reduce ;

: find-sets ( seq -- seq )
    3 <combinations> [ valid-set? ] filter ;

: deal-hand ( m n -- seq valid? )
    [ deck swap sample ] dip over find-sets length = ;

: find-valid-hand ( m n -- seq )
    [ f ] 2dip '[ drop _ _ deal-hand not ] loop ;

: set-puzzle ( m n -- )
    [ find-valid-hand ] 2keep
    [ "Dealt %d cards:\n" printf simple-table. nl ]
    [
        "Containing %d sets:\n" printf find-sets
        { { " " " " " " " " } } join simple-table. nl
    ] bi-curry* bi ;

: main ( -- )
    9  4 set-puzzle
    12 6 set-puzzle ;

MAIN: main
