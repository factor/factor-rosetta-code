! Task:
! 
! Starting from the sequence a(1)=1 and a(2)=2 find the next smallest
! number which is coprime to the last two predecessors and has not yet
! appeared yet in the sequence.
! 
! p and q are coprimes if they have no common factors other than 1.
! 
! Let p, q < 50

USING: combinators.short-circuit.smart formatting grouping io
kernel make math prettyprint sequences sets ;

: coprime? ( m n -- ? ) simple-gcd 1 = ;

: coprime-both? ( m n o -- ? ) '[ _ coprime? ] both? ;

: triplet? ( hs m n o -- ? )
    { [ coprime-both? nip ] [ 2nip swap in? not ] } && ;

: next ( hs m n -- hs' m' n' )
    0 [ 4dup triplet? ] [ 1 + ] until
    nipd pick [ adjoin ] keepd ;

: (triplets-upto) ( n -- )
    [ HS{ 1 2 } clone 1 , 1 2 ] dip
    '[ 2dup [ _ < ] both? ] [ dup , next ] while 3drop ;

: triplets-upto ( n -- seq ) [ (triplets-upto) ] { } make ;

"Coprime triplets under 50:" print
50 triplets-upto
[ 9 group simple-table. nl ]
[ length "Found %d terms.\n" printf ] bi
