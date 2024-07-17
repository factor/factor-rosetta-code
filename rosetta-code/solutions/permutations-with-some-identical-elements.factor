! Sometimes you want to find all permutations of elements where some
! elements are repeated, e.g. you have 3 red balls, 2 blue balls and one
! black ball.
! 
! If you just do all permutations of the 6 elements, each permutation will
! be duplicated 12 times where you can't tell that the identical elements
! have switched places.
! 
! Given an input of the form [a₁, a₂, ···, a_(k)] where a_(k) denotes how
! many duplicates of element k you should have,
! 
! each a_(k) > 0 and the sum of all a_(k) is n.
! 
! You should get n! / (a₁! × a₂! ... × a_(k)!) permutations as a result.
! 
! (You may, of course, denote the elements 0..k-1 if that works better.)
! 
! For example, the input [2,1] should give results (1,1,2), (1,2,1) and
! (2,1,1).
! 
! Alternatively, if zero-based: (0,0,1), (0,1,0) and (1,0,0).
! 
! Task:
! 
! List the permutations you get from the input [2, 3, 1].
! 
! Optionally output the permutations as strings where the first element is
! represented by A, the second by B and the third by C
! 
! (the example result would then be AAB, ABA and BAA).
! 
! Related tasks:
! 
! -   Anagrams
! -   Permutations
! -   Permutations/Derangements

USING: arrays grouping math math.combinatorics prettyprint
sequences sets ;

: distinct-permutations ( seq -- seq )
    [ CHAR: A + <array> ] map-index "" concat-as <permutations>
    members ;

{ 2 3 1 } distinct-permutations 10 group simple-table.
