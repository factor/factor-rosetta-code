! A perfect shuffle (or faro/weave shuffle) means splitting a deck of
! cards into equal halves, and perfectly interleaving them - so that you
! end up with the first card from the left half, followed by the first
! card from the right half, and so on:
! 
!     
! 
!         7♠ 8♠ 9♠ J♠ Q♠ K♠
! 
!         →
! 
!         7♠ 8♠ 9♠
! 
! J♠ Q♠ K♠
! 
! →
! 
! 7♠ J♠ 8♠ Q♠ 9♠ K♠
! 
! When you repeatedly perform perfect shuffles on an even-sized deck of
! unique cards, it will at some point arrive back at its original order.
! How many shuffles this takes, depends solely on the number of cards in
! the deck - for example for a deck of eight cards it takes three
! shuffles:
! 
!     
! 
!         {| style="border-spacing:0.5em
!         0;border-collapse:separate;margin:0 1em;text-align:right"
! 
! |- | original: || 1 2 3 4 5 6 7 8 |- | after 1st shuffle: || 1 5 2 6 3 7
! 4 8 |- | after 2nd shuffle: || 1 3 5 7 2 4 6 8 |- | after 3rd shuffle:
! || 1 2 3 4 5 6 7 8 |}
! 
! The Task
! 
! 1.  Write a function that can perform a perfect shuffle on an even-sized
!     list of values.
! 2.  Call this function repeatedly to count how many shuffles are needed
!     to get a deck back to its original order, for each of the deck sizes
!     listed under "Test Cases" below.
!     -   You can use a list of numbers (or anything else that's
!         convenient) to represent a deck; just make sure that all "cards"
!         are unique within each deck.
!     -   Print out the resulting shuffle counts, to demonstrate that your
!         program passes the test-cases.
! 
! Test Cases
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! input (deck size) !! output (number of shuffles required) |- | 8 ||
! 3 |- | 24 || 11 |- | 52 || 8 |- | 100 || 30 |- | 1020 || 1018 |- | 1024
! || 10 |- | 10000 || 300 |}

USING: arrays formatting kernel math prettyprint sequences
sequences.merged ;
IN: rosetta-code.perfect-shuffle

CONSTANT: test-cases { 8 24 52 100 1020 1024 10000 }

: shuffle ( seq -- seq' ) halves 2merge ;

: shuffle-count ( n -- m )
    <iota> >array 0 swap dup [ 2dup = ] [ shuffle [ 1 + ] 2dip ]
    do until 2drop ;

"Deck size" "Number of shuffles required" "%-11s %-11s\n" printf
test-cases [ dup shuffle-count "%-11d %-11d\n" printf ] each
