! Matt Parker of the "Stand Up Maths channel" has a YouTube video of a
! card trick that creates a semblance of order from chaos.
! 
! The task is to simulate the trick in a way that mimics the steps shown
! in the video.
! 
! 1. Cards.
! 
! 1.  Create a common deck of cards of 52 cards (which are half red, half
!     black).
! 2.  Give the pack a good shuffle.
! 
! 2. Deal from the shuffled deck, you'll be creating three piles.
! 
! 1.  Assemble the cards face down.
!     1.  Turn up the top card and hold it in your hand.
!         1.  if the card is black, then add the next card (unseen) to the
!             "black" pile.
!         2.  If the card is red, then add the next card (unseen) to the
!             "red" pile.
!     2.  Add the top card that you're holding to the discard pile. (You
!         might optionally show these discarded cards to get an idea of
!         the randomness).
! 2.  Repeat the above for the rest of the shuffled deck.
! 
! 3. Choose a random number (call it X) that will be used to swap cards from the "red" and "black" piles.
! 
! 1.  Randomly choose X cards from the "red" pile (unseen), let's call
!     this the "red" bunch.
! 2.  Randomly choose X cards from the "black" pile (unseen), let's call
!     this the "black" bunch.
! 3.  Put the "red" bunch into the "black" pile.
! 4.  Put the "black" bunch into the "red" pile.
! 5.  (The above two steps complete the swap of X cards of the "red" and
!     "black" piles.
! 
! (Without knowing what those cards are --- they could be red or black, nobody knows).
! 
! 4. Order from randomness?
! 
! 1.  Verify (or not) the mathematician's assertion that:
! 
!      The number of black cards in the "black" pile equals the number of red cards in the "red" pile. 
! 
! (Optionally, run this simulation a number of times, gathering more
! evidence of the truthfulness of the assertion.)
! 
! Show output on this page.

USING: accessors combinators.extras formatting fry
generalizations io kernel math math.ranges random sequences
sequences.extras ;
IN: rosetta-code.mind-boggling-card-trick

SYMBOLS: R B ;

TUPLE: piles deck red black discard ;

: initialize-deck ( -- seq )
    [ R ] [ B ] [ '[ 26 _ V{ } replicate-as ] call ] bi@ append
    randomize ;

: <piles> ( -- piles )
    initialize-deck [ V{ } clone ] thrice piles boa ;
    
: deal-step ( piles -- piles' )
    dup [ deck>> pop dup ] [ discard>> push ] [ deck>> pop ] tri
    B = [ over black>> ] [ over red>> ] if push ;
    
: deal ( piles -- piles' ) 26 [ deal-step ] times ;

: choose-sample-size ( piles -- n )
    [ red>> ] [ black>> ] bi shorter length [0,b] random ;

! Partition a sequence into n random samples in one sequence and
! the leftovers in another.
: sample-partition ( vec n -- leftovers sample )
    [ 3 dupn ] dip sample dup
    [ [ swap remove-first! drop ] with each ] dip ;
    
: perform-swaps ( piles -- piles' )
    dup dup choose-sample-size dup "Swapping %d\n" printf
    [ [ red>> ] dip ] [ [ black>> ] dip ] 2bi
    [ sample-partition ] 2bi@ [ append ] dip rot append
    [ >>black ] dip >>red ;
    
: test-assertion ( piles -- )
    [ red>> ] [ black>> ] bi
    [ [ R = ] count ] [ [ B = ] count ] bi* 2dup =
    [ "Assertion correct!" ]
    [ "Assertion incorrect!" ] if print
    "R in red: %d\nB in black: %d\n" printf ;
    
: main ( -- )
    <piles>                             ! step 1
    deal                                ! step 2
    dup "Post-deal state:\n%u\n" printf
    perform-swaps                       ! step 3
    dup "Post-swap state:\n%u\n" printf
    test-assertion ;                    ! step 4

MAIN: main
