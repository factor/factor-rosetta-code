! Generate the sequence of penta-power prime seeds: positive integers n
! such that:
! 
!    n⁰ + n + 1, n¹ + n + 1, n² + n + 1, n³ + n + 1 and n⁴ + n + 1 are all prime.
! 
! Task
! 
! -   Find and display the first thirty penta-power prime seeds. (Or as
!     many as are reasonably supported by your languages math capability
!     if it is less.)
! 
! Stretch
! 
! -   Find and display the position and value of first with a value
!     greater than ten million.
! 
! See also
! *Task: Quad-power prime seeds
! 
! I can find no mention or record of this sequence anywhere. Perhaps I've
! invented it.

USING: grouping io kernel lists lists.lazy math math.functions
math.primes prettyprint tools.memory.private ;

: seed? ( n -- ? )
    5 [ dupd ^ 1 + + prime? ] with all-integers? ;

: pentas ( -- list )
    1 lfrom [ seed? ] lfilter [ commas ] lmap-lazy ;

"First thirty penta-power prime seeds:" print
30 pentas ltake list>array 5 group simple-table.
