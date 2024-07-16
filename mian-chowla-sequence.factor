! The Mian–Chowla sequence is an integer sequence defined recursively.
! 
! Mian–Chowla is an infinite instance of a Sidon sequence, and belongs to
! the class known as B₂ sequences.
! 
! The sequence starts with:
! 
!         a₁ = 1
! 
! then for n > 1, a_(n) is the smallest positive integer such that every
! pairwise sum
! 
!         a_(i) + a_(j)
! 
! is distinct, for all i and j less than or equal to n.
! 
! The Task:
! 
! -   -   Find and display, here, on this page the first 30 terms of the
!         Mian–Chowla sequence.
!     -   Find and display, here, on this page the 91st through 100th
!         terms of the Mian–Chowla sequence.
! 
! Demonstrating working through the first few terms longhand:
! 
!         a₁ = 1
! 
!         1 + 1 = 2
! 
! Speculatively try a₂ = 2
! 
!         1 + 1 = 2
!         1 + 2 = 3
!         2 + 2 = 4
! 
! There are no repeated sums so 2 is the next number in the sequence.
! 
! Speculatively try a₃ = 3
! 
!         1 + 1 = 2
!         1 + 2 = 3
!         1 + 3 = 4
!         2 + 2 = 4
!         2 + 3 = 5
!         3 + 3 = 6
! 
! Sum of 4 is repeated so 3 is rejected.
! 
! Speculatively try a₃ = 4
! 
!         1 + 1 = 2
!         1 + 2 = 3
!         1 + 4 = 5
!         2 + 2 = 4
!         2 + 4 = 6
!         4 + 4 = 8
! 
! There are no repeated sums so 4 is the next number in the sequence.
! 
! And so on...
! 
! See also:
! 
! -   -   OEIS:A005282 Mian-Chowla sequence

USING: fry hash-sets io kernel math prettyprint sequences sets ;

: next ( seq sums speculative -- seq' sums' speculative' )
    dup reach [ + ] with map over dup + suffix! >hash-set pick
    over intersect null?
    [ swapd union [ [ suffix! ] keep ] dip swap ] [ drop ] if
    1 + ;

: mian-chowla ( n -- seq )
    [ V{ 1 } HS{ 2 } [ clone ] bi@ 2 ] dip
    '[ pick length _ < ] [ next ] while 2drop ;

100 mian-chowla
[ 30 head "First 30 terms of the Mian-Chowla sequence:" ]
[ 10 tail* "Terms 91-100 of the Mian-Chowla sequence:" ] bi
[ print [ pprint bl ] each nl nl ] 2bi@
