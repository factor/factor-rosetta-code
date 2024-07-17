! There are many techniques that people use to shuffle cards for card
! games. Some are more effective than others.
! 
! Task
! 
! Implement the (seemingly) more common techniques of the riffle shuffle
! and overhand shuffle for n iterations.
! 
! Implementing playing cards is not necessary if it would be easier to
! implement these shuffling methods for generic collections.
! 
! Where possible, compare this to a standard/built-in shuffling procedure.
! 
! One iteration of the riffle shuffle is defined as:
! 
! 1.  Split the deck into two piles
! 2.  Merge the two piles by taking one card from the top of either pile
!     in proportion to the number of cards remaining in the pile. To start
!     with the probability for both piles will be 26/52 (50-50), then
!     25/51-26/51 etc etc as the riffle progresses.
! 3.  The merged deck is now the new "shuffled" deck
! 
! One iteration of the overhand shuffle is defined as:
! 
! 1.  Take a group of consecutive cards from the top of the deck. For our
!     purposes up to 20% of the deck seems like a good amount.
! 2.  Place that group on top of a second pile
! 3.  Repeat these steps until there are no cards remaining in the
!     original deck
! 4.  The second pile is now the new "shuffled" deck
! 
! Bonus
! 
! Implement other methods described in the Wikipedia article: card
! shuffling.
! 
! Allow for "human errors" of imperfect cutting and interleaving.
! 
! Related tasks:
! 
! -   Playing cards
! -   Deal cards_for_FreeCell
! -   War Card_Game
! -   Poker hand_analyser
! -   Go Fish
! 
! Category:Games


