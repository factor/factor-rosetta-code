! Task:
! 
! Given a sequence of integers, find a continuous subsequence which
! maximizes the sum of its elements, that is, the elements of no other
! single subsequence add up to a value larger than this one.
! 
! An empty subsequence is considered to have the sum of 0; thus if all
! elements are negative, the result must be the empty sequence.
! 
! Category:Arithmetic operations

USING: kernel locals math math.order sequences ;

:: max-with-index ( elt0 ind0 elt1 ind1 -- elt ind )
elt0 elt1 <  [ elt1 ind1 ] [ elt0 ind0 ] if ;
: last-of-max ( accseq -- ind ) -1 swap -1 [ max-with-index ] reduce-index nip ;

: max-subseq ( seq -- subseq )
dup 0 [ + 0 max ] accumulate swap suffix last-of-max head
dup 0 [ + ] accumulate swap suffix [ neg ] map last-of-max tail ;
