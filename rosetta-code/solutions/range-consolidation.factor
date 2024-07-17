! Define a range of numbers R, with bounds b0 and b1 covering all numbers
! between and including both bounds.
! 
! That range can be shown as:
! 
!     
! 
!         [b0, b1]
! 
!     
! 
!         or equally as:
! 
!             [b1, b0]
! 
! Given two ranges, the act of consolidation between them compares the two
! ranges:
! 
! -   If one range covers all of the other then the result is that
!     encompassing range.
! -   If the ranges touch or intersect then the result is one new single
!     range covering the overlapping ranges.
! -   Otherwise the act of consolidation is to return the two non-touching
!     ranges.
! 
! Given N ranges where N > 2 then the result is the same as repeatedly
! replacing all combinations of two ranges by their consolidation until no
! further consolidation between range pairs is possible.
! 
! If N < 2 then range consolidation has no strict meaning and the input
! can be returned.
! 
! Example 1:
!     Given the two ranges [1, 2.5] and [3, 4.2] then
!     there is no common region between the ranges and the result is the
!     same as the input.
! 
! Example 2:
!     Given the two ranges [1, 2.5] and [1.8, 4.7] then
!     there is : an overlap [2.5, 1.8] between the ranges and
!     the result is the single range [1, 4.7].
!     Note that order of bounds in a range is not (yet) stated.
! 
! Example 3:
!     Given the two ranges [6.1, 7.2] and [7.2, 8.3] then
!     they touch at 7.2 and
!     the result is the single range [6.1, 8.3].
! 
! Example 4:
!     Given the three ranges [1, 2] and [4, 8] and [2, 5]
!     then there is no intersection of the ranges [1, 2] and [4, 8]
!     but the ranges [1, 2] and [2, 5] overlap and
!     consolidate to produce the range [1, 5].
!     This range, in turn, overlaps the other range [4, 8], and
!     so consolidates to the final output of the single range [1, 8].
! 
! Task:
! 
! Let a normalized range display show the smaller bound to the left; and
! show the range with the smaller lower bound to the left of other ranges
! when showing multiple ranges.
! 
! Output the normalized result of applying consolidation to these five
! sets of ranges:
! 
!            [1.1, 2.2]
!            [6.1, 7.2], [7.2, 8.3]
!            [4, 3], [2, 1]
!            [4, 3], [2, 1], [-1, -2], [3.9, 10]
!            [1, 3], [-6, -1], [-4, -5], [8, 2], [-6, -6]  
! 
! Show all output here.
! 
! See also:
! 
! -   Set consolidation
! -   Set of real numbers

USING: arrays combinators formatting kernel math.combinatorics
math.order math.statistics sequences sets sorting ;

: overlaps? ( pair pair -- ? )
    2dup swap [ [ first2 between? ] curry any? ] 2bi@ or ;

: merge ( seq -- newseq ) concat minmax 2array 1array ;

: merge1 ( seq -- newseq )
    dup 2 [ first2 overlaps? ] find-combination
    [ [ without ] keep merge append ] when* ;

: normalize ( seq -- newseq ) [ natural-sort ] map ;

: consolidate ( seq -- newseq )
    normalize [ merge1 ] to-fixed-point natural-sort ;

{
    { { 1.1 2.2 } }
    { { 6.1 7.2 } { 7.2 8.3 } }
    { { 4 3 } { 2 1 } }
    { { 4 3 } { 2 1 } { -1 -2 } { 3.9 10 } }
    { { 1 3 } { -6 -1 } { -4 -5 } { 8 2 } { -6 -6 } }
} [ dup consolidate "%49u => %u\n" printf ] each
