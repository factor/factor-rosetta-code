! Task:
! 
! Sort an array of positive integers using the Bead Sort Algorithm.
! 
! A bead sort is also known as a gravity sort.
! 
! Algorithm has O(S), where S is the sum of the integers in the input set:
! Each bead is moved individually.
! 
! This is the case when bead sort is implemented without a mechanism to
! assist in finding empty spaces below the beads, such as in software
! implementations.
! 
! Category:Sorting

USING: kernel math math.order math.vectors sequences ;
: fill ( seq len -- newseq ) [ dup length ] dip swap - 0 <repetition> append ;

: bead ( seq -- newseq )
dup 0 [ max ] reduce
[ swap 1 <repetition> swap fill ] curry map
[ ] [ v+ ] map-reduce ;

: beadsort ( seq -- newseq ) bead bead ;
