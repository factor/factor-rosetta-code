! Generate the sequence of quad-power prime seeds: positive integers n
! such that:
! 
!    n¹ + n + 1, n² + n + 1, n³ + n + 1 and n⁴ + n + 1 are all prime.
! 
! Task
! 
! -   Find and display the first fifty quad-power prime seeds. (Or as many
!     as are reasonably supported by your languages math capability if it
!     is less.)
! 
! Stretch
! 
! -   Find and display the position and value of first with a value
!     greater than one million, two million, three million.
! 
! See also
! *Task: Penta-power prime seeds
! *A219117 - Numbers n such that n^1+n+1, n^2+n+1, n^3+n+1 and n^4+n+1 are all prime

USING: grouping io kernel lists lists.lazy math math.functions
math.primes prettyprint sequences tools.memory.private ;

: seed? ( n -- ? )
    { 1 2 3 4 } [ dupd ^ 1 + + prime? ] with all? ;

: quads ( -- list )
    1 lfrom [ seed? ] lfilter [ commas ] lmap-lazy ;

"First fifty quad-power prime seeds:" print
50 quads ltake list>array 10 group simple-table.
