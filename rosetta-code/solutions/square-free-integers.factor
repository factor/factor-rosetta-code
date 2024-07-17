! Task:
! 
! Write a function to test if a number is square-free.
! 
! A square-free is an integer which is divisible by no perfect square
! other than 1 (unity).
! 
! For this task, only positive square-free numbers will be used.
! 
! Show here (on this page) all square-free integers (in a horizontal
! format) that are between:
! 
! -   -   1 ───► 145 (inclusive)
!     -   1 trillion ───► 1 trillion + 145 (inclusive)
! 
! (One trillion = 1,000,000,000,000)
! 
! Show here (on this page) the count of square-free integers from:
! 
! -   -   1 ───► one hundred (inclusive)
!     -   1 ───► one thousand (inclusive)
!     -   1 ───► ten thousand (inclusive)
!     -   1 ───► one hundred thousand (inclusive)
!     -   1 ───► one million (inclusive)
! 
! See also:
! 
! -   -   the Wikipedia entry: square-free integer

USING: formatting grouping io kernel math math.functions
math.primes.factors math.ranges sequences sets ;
IN: rosetta-code.square-free

: sq-free? ( n -- ? ) factors all-unique? ;

! Word wrap for numbers.
: numbers-per-line ( m -- n ) log10 >integer 2 + 80 swap /i ;

: sq-free-show ( from to -- )
    2dup "Square-free integers from %d to %d:\n" printf
    [ [a,b] [ sq-free? ] filter ] [ numbers-per-line group ] bi
    [ [ "%3d " printf ] each nl ] each nl ;
    
: sq-free-count ( limit -- )
    dup [1,b] [ sq-free? ] count swap
    "%6d square-free integers from 1 to %d\n" printf ;
    
1 145 10 12 ^ dup 145 + [ sq-free-show ] 2bi@         ! part 1
2 6 [a,b] [ 10 swap ^ ] map [ sq-free-count ] each    ! part 2
