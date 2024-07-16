! Task:
! 
! Given a sequence of integers, find a continuous subsequence which
! maximizes the sum of its elements, that is, the elements of no other
! single subsequence add up to a value larger than this one.
! 
! An empty subsequence is considered to have the sum of 0; thus if all
! elements are negative, the result must be the empty sequence.

( scratchpad ) { -1 -2 3 5 6 -2 -1 4 -4 2 -1 } max-subseq  dup sum  swap . .
{ 3 5 6 -2 -1 4 }
15
