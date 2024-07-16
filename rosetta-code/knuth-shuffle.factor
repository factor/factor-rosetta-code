! The Knuth shuffle (a.k.a. the Fisher-Yates shuffle) is an algorithm for
! randomly shuffling the elements of an array.
! 
! Task:
! 
! Implement the Knuth shuffle for an integer array (or, if possible, an
! array of any type).
! 
! Specification:
! 
! Given an array itemswith indices ranging from0'' tolast'', the algorithm
! can be defined as follows (pseudo-code):
! 
!        for i from last downto 1 do:
!            let j = random integer in range 0 ≤ j ≤ i
!            swap items[i] with items[j]
! 
! Notes:
! 
! -   It modifies the input array in-place.
! -   If that is unreasonable in your programming language, you may amend
!     the algorithm to return the shuffled items as a new array instead.
! -   The algorithm can also be amended to iterate from left to right, if
!     that is more convenient.
! 
! Test cases:
! 
!         {| class="wikitable"
! 
! |- ! Input array ! Possible output arrays |- | [] | [] |- | [10] | [10]
! |- | [10, 20] | [10, 20] [20, 10] |- | [10, 20, 30] | [10, 20, 30]
! [10, 30, 20] [20, 10, 30] [20, 30, 10] [30, 10, 20] [30, 20, 10] |}
! 
! (These are listed here just for your convenience; no need to demonstrate
! them on the page.)
! 
! Related task:
! 
! -   Sattolo cycle

: randomize ( seq -- seq )
    dup length [ dup 1 > ]
    [ [ iota random ] [ 1 - ] bi [ pick exchange ] keep ]
    while drop ;
