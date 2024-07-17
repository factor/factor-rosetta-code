! Task:
! 
! Create a data structure and the associated methods to define and
! manipulate a deck of playing cards.
! 
! The deck should contain 52 unique cards.
! 
! The methods must include the ability to:
! 
! -   -   make a new deck
!     -   shuffle (randomize) the deck
!     -   deal from the deck
!     -   print the current contents of a deck
! 
! Each card must have a pip value and a suit value which constitute the
! unique value of the card.
! 
! Related tasks:
! 
! -   Card shuffles
! -   Deal cards_for_FreeCell
! -   War Card_Game
! -   Poker hand_analyser
! -   Go Fish
! 
! Category:Cards

USING: formatting grouping io kernel math qw random sequences
vectors ;
IN: rosetta-code.playing-cards

CONSTANT: pips  qw{ A 2 3 4 5 6 7 8 9 10 J Q K }
CONSTANT: suits qw{ ♥ ♣ ♦ ♠ }

: <deck> ( -- vec ) 52 <iota> >vector ;

: card>str ( n -- str )
    13 /mod [ suits nth ] [ pips nth ] bi* prepend ;
    
: print-deck ( seq -- )
    13 group [ [ card>str "%-4s" printf ] each nl ] each ;
    
<deck>       ! make new deck
randomize    ! shuffle the deck
dup pop drop ! deal from the deck (and discard)
print-deck   ! print the deck
