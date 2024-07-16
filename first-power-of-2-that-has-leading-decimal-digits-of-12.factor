! (This task is taken from a Project Euler problem.)
! 
! (All numbers herein are expressed in base ten.)
! 
! 2⁷ = 128 and 7 is the first power of 2 whose leading decimal digits are
! 12.
! 
! The next power of 2 whose leading decimal digits are 12 is 80,
! 
! 2⁸⁰ = 1208925819614629174706176.
! 
! Define p(L,n) to be the n^(th)-smallest value of j such that the base
! ten representation of 2^(j) begins with the digits of L.
! 
!     So   p(12, 1) =  7    and
!          p(12, 2) = 80
! 
! You are also given that:
! 
!          p(123, 45) = 12710
! 
! Task:
! 
! -   -   find:
!         -   -    p(12, 1)
!             -    p(12, 2)
!             -    p(123, 45)
!             -    p(123, 12345)
!             -    p(123, 678910)
!     -   display the results here, on this page.

USING: formatting fry generalizations kernel literals math
math.functions math.parser sequences tools.time ;

CONSTANT: ld10 $[ 2 log 10 log / ]

: p ( L n -- m )
    swap [ 0 0 ]
    [ '[ over _ >= ] ]
    [ [ log10 >integer 10^ ] keep ] tri*
    '[
        1 + dup ld10 * dup >integer - 10 log * e^ _ * truncate
        _ number= [ [ 1 + ] dip ] when
    ] until nip ;
 
[
    12 1
    12 2
    123 45
    123 12345
    123 678910
    [ 2dup p "%d %d p = %d\n" printf ] 2 5 mnapply
] time
