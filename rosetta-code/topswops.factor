! Topswops is a card game created by John Conway in the 1970's.
! 
! Assume you have a particular permutation of a set of n cards numbered
! 1..n on both of their faces, for example the arrangement of four cards
! given by [2, 4, 1, 3] where the leftmost card is on top.
! 
! A round is composed of reversing the first m cards where m is the value
! of the topmost card.
! 
! Rounds are repeated until the topmost card is the number 1 and the
! number of swaps is recorded.
! 
! For our example the swaps produce:
! 
!         [2, 4, 1, 3]    # Initial shuffle
!         [4, 2, 1, 3]
!         [3, 1, 2, 4]
!         [2, 1, 3, 4]
!         [1, 2, 3, 4]
! 
! For a total of four swaps from the initial ordering to produce the
! terminating case where 1 is on top.
! 
! For a particular number n of cards, topswops(n) is the maximum swaps
! needed for any starting permutation of the n cards.
! 
! Task:
! 
! The task is to generate and show here a table of n vs topswops(n) for n
! in the range 1..10 inclusive.
! 
! Note:
! 
! Topswops is also known as Fannkuch from the German word Pfannkuchen
! meaning pancake.
! 
! Related tasks:
! 
! -   Number reversal game
! -   Sorting algorithms/Pancake sort

USING: formatting kernel math math.combinatorics math.order
math.ranges sequences ;
FROM: sequences.private => exchange-unsafe ;
IN: rosetta-code.topswops

! Reverse a subsequence in-place from 0 to n.
: head-reverse! ( seq n -- seq' )
    dupd [ 2/ ] [ ] bi rot
    [ [ over - 1 - ] dip exchange-unsafe ] 2curry each-integer ;

! Reverse the elements in seq according to the first element.
: swop ( seq -- seq' ) dup first head-reverse! ;

! Determine the number of swops until 1 is the head.
: #swops ( seq -- n )
    0 swap [ dup first 1 = ] [ [ 1 + ] [ swop ] bi* ] until
    drop ;

! Determine the maximum number of swops for a given length.
: topswops ( n -- max )
    [1,b] <permutations> [ #swops ] [ max ] map-reduce ;

: main ( -- )
    10 [1,b] [ dup topswops "%2d: %2d\n" printf ] each ;

MAIN: main
