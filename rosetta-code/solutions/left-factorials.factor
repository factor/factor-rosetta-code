! Left factorials, !n, may refer to either subfactorials or to factorial
! sums;
! 
! the same notation can be confusingly seen being used for the two
! different definitions.
! 
! Sometimes, subfactorials (also known as derangements) may use any of the
! notations:
! 
! - -  !n`
!   -  !n
!   -  n¡
! 
! (It may not be visually obvious, but the last example uses an
! upside-down exclamation mark.)
! 
! This Rosetta Code task will be using this formula (factorial sums) for
! left factorial:
! 
!     
! 
!         $!n = \sum_{k=0}^{n-1} k!$
! 
!     
! 
!         where
! 
!     
! 
!         !0 = 0
! 
! Task
! 
! Display the left factorials for:
! 
! - zero through ten (inclusive)
! - 20 through 110 (inclusive) by tens
! 
! Display the length (in decimal digits) of the left factorials for:
! 
! - 1,000 through 10,000 (inclusive), by thousands.
! 
! Also see
! 
!     
! 
! - The OEIS entry: A003422 left factorials
! - The MathWorld entry: left factorial
! - The MathWorld entry: factorial sums
! - The MathWorld entry: subfactorial
! 
! Related task
! 
!     
! 
! - permutations/derangements (subfactorials)
! 
! Category:Mathematics

USING: formatting fry io kernel math math.factorials
math.functions math.parser math.ranges sequences ;
IN: rosetta-code.left-factorials

: left-factorial ( n -- m ) <iota> [ n! ] map-sum ;

: print-left-factorials ( seq quot -- )
    '[
        dup left-factorial @
        [ number>string "!" prepend ] dip
        "%6s   %-6d\n" printf
    ] each nl ; inline
    
: digit-count ( n -- count ) log10 >integer 1 + ;

: part1 ( -- ) 11 <iota> [ ] print-left-factorials ;
    
: part2 ( -- ) 20 110 10 <range> [ ] print-left-factorials ;

: part3 ( -- )
    "Number of digits for" print
    1,000 10,000 1,000 <range>
    [ digit-count ] print-left-factorials ;
    
: main ( -- ) part1 part2 part3 ;

MAIN: main
