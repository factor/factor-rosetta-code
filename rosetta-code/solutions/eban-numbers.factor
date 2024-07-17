! Definition:
! 
! An eban number is a number that has no letter e in it when the number is
! spelled in English.
! 
! Or more literally, spelled numbers that contain the letter e are banned.
! 
! The American version of spelling numbers will be used here (as opposed
! to the British).
! 
! 2,000,000,000 is two billion, not two milliard.
! 
! Only numbers less than one sextillion (10²¹) will be considered in/for
! this task.
! 
! This will allow optimizations to be used.
! 
! Task:
! 
! -   -   show all eban numbers ≤ 1,000 (in a horizontal format), and a
!         count
!     -   show all eban numbers between 1,000 and 4,000 (inclusive), and a
!         count
!     -   show a count of all eban numbers up and including 10,000
!     -   show a count of all eban numbers up and including 100,000
!     -   show a count of all eban numbers up and including 1,000,000
!     -   show a count of all eban numbers up and including 10,000,000
!     -   show all output here.
! 
! See also:
! 
! -   -   The MathWorld entry: eban numbers.
!     -   The OEIS entry: A6933, eban numbers.
!     -   Number names.

USING: arrays formatting fry io kernel math math.functions
math.order math.ranges prettyprint sequences ;

: eban? ( n -- ? )
    1000000000 /mod 1000000 /mod 1000 /mod
    [ dup 30 66 between? [ 10 mod ] when ] tri@ 4array
    [ { 0 2 4 6 } member? ] all? ;

: .eban ( m n -- ) "eban numbers in [%d, %d]: " printf ;
: eban ( m n q -- o ) '[ 2dup .eban [a,b] [ eban? ] @ ] call ; inline
: .eban-range ( m n -- ) [ filter ] eban "%[%d, %]\n" printf ;
: .eban-count ( m n -- ) "count of " write [ count ] eban . ;

1 1000 1000 4000 [ .eban-range ] 2bi@
4 9 [a,b] [ [ 1 10 ] dip ^ .eban-count ] each
