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

USING: arrays io kernel locals math math.ranges sequences ;
IN: rosetta-code.distinct-permutations

: should-swap? ( start curr seq -- ? )
    [ nipd nth ] [ <slice> member? not ] 3bi ;

:: .find-permutations ( seq index n -- )
    index n >= [ seq write bl ] [
        index n [a,b) [
            :> i
            index i seq should-swap? [
                index i seq exchange
                seq index 1 + n .find-permutations
                index i seq exchange
            ] when
        ] each
    ] if ;

: first-permutation ( nums charset -- seq )
    [ <array> ] 2map "" concat-as ;

: .distinct-permutations ( nums charset -- )
    first-permutation 0 over length .find-permutations nl ;

: main ( -- )
    { 2 1 } "12"
    { 2 3 1 } "123"
    { 2 3 1 } "ABC"
    [ .distinct-permutations ] 2tri@ ;

MAIN: main
