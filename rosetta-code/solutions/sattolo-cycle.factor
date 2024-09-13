! The Sattolo cycle is an algorithm for randomly shuffling an array in
! such a way that each element ends up in a new position.
! 
! Implement the Sattolo cycle for an integer array (or, if possible, an
! array of any type).
! 
! Given an array itemswith indices ranging from0'' tolast'', the algorithm
! can be defined as follows (pseudo-code):
! 
! for i from last downto 1 do:
!     let j = random integer in range 0 ≤ j < i
!     swap items[i] with items[j]
! 
! Notes:
! 
! -   It modifies the input array in-place. If that is unreasonable in
!     your programming language, you may amend the algorithm to return the
!     shuffled items as a new array instead.
! -   The algorithm can also be amended to iterate from left to right, if
!     that is more convenient.
! -   The only difference between this and the Knuth shuffle, is that j is
!     chosen from the range 0 ≤ j < i, rather than 0 ≤ j ≤ i. This is what
!     ensures that every element ends up in a new position, as long as
!     there are at least two elements.
! 
!   Input array                                        Possible output arrays
!   -------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------
!   []                                                 []
!   [10]                                               [10]
!   [10, 20]                                           [20, 10]
!   [10, 20, 30]                                       [20, 30, 10] [30, 10, 20]
!   [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]   39,916,800 possibilities. You'll know you have a correct one if it has the same elements as the input array, but none in their original place.
! 
! -   Knuth shuffle

USING: arrays io kernel literals math math.ranges prettyprint
random sequences ;
IN: rosetta-code.sattolo-cycle

: (sattolo) ( seq -- seq' )
    dup dup length 1 - 1 [a,b]
    [ dup iota random rot exchange ] with each ;
    
: sattolo ( seq -- seq/seq' )
    dup length 1 > [ (sattolo) ] when ;

{
    { }
    { 10 }
    { 10 20 }
    { 10 20 30 }
    $[ 11 22 [a,b] >array ]
}
[
    [ "original: " write .         ]
    [ "cycled:   " write sattolo . ] bi nl
] each
