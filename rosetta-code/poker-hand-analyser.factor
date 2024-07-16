! Task:
! 
! Create a program to parse a single five card poker hand and rank it
! according to this list of poker hands.
! 
! A poker hand is specified as a space separated list of five playing
! cards.
! 
! Each input card has two characters indicating face and suit.
! 
! Example:
! 
!         2d (two of diamonds).
! 
! Faces are:  a, 2, 3, 4, 5, 6, 7, 8, 9, 10, j, q, k
! 
! Suits are:  h (hearts), d (diamonds), c (clubs), and s (spades), or
! 
! alternatively, the unicode card-suit characters:   ♥ ♦ ♣ ♠
! 
! Duplicate cards are illegal.
! 
! The program should analyze a single hand and produce one of the
! following outputs:
! 
!  straight-flush
!  four-of-a-kind
!  full-house
!  flush
!  straight
!  three-of-a-kind
!  two-pair
!  one-pair
!  high-card
!  invalid
! 
! Examples:
! 
!    2♥ 2♦ 2♣ k♣ q♦:   three-of-a-kind
!    2♥ 5♥ 7♦ 8♣ 9♠:   high-card
!    a♥ 2♦ 3♣ 4♣ 5♦:   straight
!    2♥ 3♥ 2♦ 3♣ 3♦:   full-house
!    2♥ 7♥ 2♦ 3♣ 3♦:   two-pair
!    2♥ 7♥ 7♦ 7♣ 7♠:   four-of-a-kind 
!    10♥ j♥ q♥ k♥ a♥:  straight-flush
!    4♥ 4♠ k♠ 5♦ 10♠:  one-pair
!    q♣ 10♣ 7♣ 6♣ q♣:  invalid
! 
! The programs output for the above examples should be displayed here on
! this page.
! 
! Extra credit:
! 
! 1.  use the playing card characters introduced with Unicode 6.0
!     (U+1F0A1 - U+1F0DE).
! 2.  allow two jokers
! 
! -   -   use the symbol joker
!     -   duplicates would be allowed (for jokers only)
!     -   five-of-a-kind would then be the highest hand
! 
! More extra credit examples:
! 
!    joker  2♦  2♠  k♠  q♦:     three-of-a-kind
!    joker  5♥  7♦  8♠  9♦:     straight
!    joker  2♦  3♠  4♠  5♠:     straight
!    joker  3♥  2♦  3♠  3♦:     four-of-a-kind
!    joker  7♥  2♦  3♠  3♦:     three-of-a-kind
!    joker  7♥  7♦  7♠  7♣:     five-of-a-kind
!    joker  j♥  q♥  k♥  A♥:     straight-flush
!    joker  4♣  k♣  5♦ 10♠:     one-pair
!    joker  k♣  7♣  6♣  4♣:     flush
!    joker  2♦  joker  4♠  5♠:  straight
!    joker  Q♦  joker  A♠ 10♠:  straight
!    joker  Q♦  joker  A♦ 10♦:  straight-flush
!    joker  2♦  2♠  joker  q♦:  four-of-a-kind
! 
! Related tasks:
! 
! -   Playing cards
! -   Card shuffles
! -   Deal cards_for_FreeCell
! -   War Card_Game
! -   Go Fish

USING: formatting kernel poker sequences ;
{
    "2H 2D 2C KC QD"
    "2H 5H 7D 8C 9S"
    "AH 2D 3C 4C 5D"
    "2H 3H 2D 3C 3D"
    "2H 7H 2D 3C 3D"
    "2H 7H 7D 7C 7S"
    "TH JH QH KH AH"
    "4H 4S KS 5D TS"
    "QC TC 7C 6C 4C"
} [ dup string>hand-name "%s: %s\n" printf ] each
