! You are given a box with eight holes labelled A-to-H, connected by
! fifteen straight lines in the pattern as shown below:
! 
!              A   B
!             /│\ /│\
!            / │ X │ \
!           /  │/ \│  \
!          C───D───E───F
!           \  │\ /│  /
!            \ │ X │ /
!             \│/ \│/
!              G   H
! 
! You are also given eight pegs numbered 1-to-8.
! 
! Objective:
! 
! Place the eight pegs in the holes so that the (absolute) difference
! between any two numbers connected by any line is greater than one.
! 
! Example:
! 
! In this attempt:
! 
!              4   7
!             /│\ /│\
!            / │ X │ \
!           /  │/ \│  \
!          8───1───6───2
!           \  │\ /│  /
!            \ │ X │ /
!             \│/ \│/
!              3   5
! 
! Note that 7 and 6 are connected and have a difference of 1, so it is not
! a solution.
! 
! Task
! 
! Produce and show here one solution to the puzzle.
! 
! Related tasks:
! 
! -   -   A* search algorithm
!     -   Solve a Holy Knight's tour
!     -   Knight's tour
!     -   N-queens problem
!     -   Solve a Hidato puzzle
!     -   Solve a Holy Knight's tour
!     -   Solve a Hopido puzzle
!     -   Solve a Numbrix puzzle
!     -   4-rings or 4-squares puzzle
! 
! See also
! 
! No Connection Puzzle (youtube).

USING: assocs interpolate io kernel math math.combinatorics
math.ranges math.parser multiline pair-rocket sequences
sequences.generalizations ;

STRING: diagram
    ${}   ${}
   /|\ /|\
  / | X | \
 /  |/ \|  \
${} - ${} - ${} - ${}
 \  |\ /|  /
  \ | X | /
   \|/ \|/
    ${}   ${}
;

CONSTANT: adjacency
H{
    0 => { 2 3 4 }
    1 => { 3 4 5 }
    2 => { 0 3 6 }
    3 => { 0 1 2 4 6 7 }
    4 => { 0 1 3 5 6 7 }
    5 => { 1 4 7 }
    6 => { 2 3 4 }
    7 => { 3 4 5 }
}

: any-consecutive? ( seq n -- ? ) [ - abs 1 = ] curry any? ;

: neighbors ( elt seq i -- seq elt )
    adjacency at swap nths swap ;

: solution? ( permutation-seq -- ? )
    dup [ neighbors any-consecutive? ] with find-index nip not ;
    
: find-solution ( -- seq )
    8 [1,b] [ solution? ] find-permutation ;
    
: display-solution ( seq -- )
    [ number>string ] map 8 firstn diagram interpolate>string
    print ;
    
: main ( -- ) find-solution display-solution ;

MAIN: main
