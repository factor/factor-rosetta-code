! The nimbers, also known as Grundy numbers, are the values of the heaps
! in the game of Nim. They have addition and multiplication operations,
! unrelated to the addition and multiplication of the integers. Both
! operations are defined recursively:
! 
! The nim-sum of two integers and , denoted is given by
! 
! ,
! 
! where the mex function returns the smallest integer not in the set. More
! simply: collect all the nim-sums of m and numbers smaller than n, and
! all nim-sums of n with all numbers less than m and find the smallest
! number not in that set. Fortunately, this also turns out to be equal to
! the bitwise xor of the two.
! 
! The nim-product is also defined recursively:
! 
! The product is more complicated and time-consuming to evaluate, but
! there are a few facts which may help:
! 
! -   The operators and are commutative and distributive
! -   the nim-product of a Fermat power () and a smaller number is their
!     ordinary product
! -   the nim-square of a Fermat power is the ordinary product
! 
! Tasks:
! 
! 1.  Create nimber addition and multiplication tables up to at least 15
! 2.  Find the nim-sum and nim-product of two five digit integers of your
!     choice

USING: combinators formatting io kernel locals math sequences ;

! highest power of 2 that divides a given number
: hpo2 ( n -- n ) dup neg bitand ;

! base 2 logarithm of the highest power of 2 dividing a given number
: lhpo2 ( n -- n )
    hpo2 0 swap [ dup even? ] [ -1 shift [ 1 + ] dip ] while drop ;

! nim sum of two numbers
ALIAS: nim-sum bitxor

! nim product of two numbers
:: nim-prod ( x y -- prod )
    x hpo2 :> h!
    0 :> comp!
    {
        { [ x 2 < y 2 < or ] [ x y * ] }
        { [ x h > ] [ h y nim-prod x h bitxor y nim-prod bitxor ] }   ! recursively break x into its powers of 2
        { [ y hpo2 y < ] [ y x nim-prod ] }                           ! recursively break y into its powers of 2 by flipping the operands
        { [ x y [ lhpo2 ] bi@ bitand comp! comp zero? ] [ x y * ] }   ! we have no fermat power in common
        [
            comp hpo2 h!                                              ! a fermat number square is its sequimultiple
            x h neg shift y h neg shift nim-prod
            3 h 1 - shift nim-prod
        ]
    } cond ;

! words for printing tables
: dashes ( n -- ) [ CHAR: - ] "" replicate-as write ;
: top1 ( str -- ) " %s |" printf 16 <iota> [ "%3d" printf ] each nl ;
: top2 ( -- ) 3 dashes bl 49 dashes nl ;

: row ( n quot -- )
    over "%2d |" printf curry 16 <iota> swap
    [ call "%3d" printf ] curry each ; inline

: table ( quot str -- )
    top1 top2 16 <iota> swap [ row nl ] curry each ; inline

! task
[ nim-sum ] "+" table nl
[ nim-prod ] "*" table nl
33333 77777
[ 2dup nim-sum "%d + %d = %d\n" printf ]
[ 2dup nim-prod "%d * %d = %d\n" printf ] 2bi
