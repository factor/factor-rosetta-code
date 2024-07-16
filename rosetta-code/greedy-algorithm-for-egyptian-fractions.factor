! An Egyptian fraction is the sum of distinct unit fractions such as:
! 
!         $\tfrac{1}{2} + \tfrac{1}{3} + \tfrac{1}{16} \,(= \tfrac{43}{48})$
! 
! Each fraction in the expression has a numerator equal to 1 (unity) and a
! denominator that is a positive integer, and all the denominators are
! distinct (i.e., no repetitions).
! 
! Fibonacci's Greedy algorithm for Egyptian fractions expands the fraction
! $\tfrac{x}{y}$ to be represented by repeatedly performing the
! replacement
! 
!         $\frac{x}{y} = \frac{1}{\lceil y/x\rceil} + \frac{(-y)\!\!\!\!\mod x}{y\lceil y/x\rceil}$
! 
! (simplifying the 2^(nd) term in this replacement as necessary, and where
! ⌈x⌉ is the ceiling function).
! 
! For this task, Proper and improper fractions must be able to be
! expressed.
! 
! Proper  fractions are of the form $\tfrac{a}{b}$ where a and b are
! positive integers, such that a < b, and
! 
! improper fractions are of the form $\tfrac{a}{b}$ where a and b are
! positive integers, such that a ≥ b.
! 
! (See the REXX programming example to view one method of expressing the
! whole number part of an improper fraction.)
! 
! For improper fractions, the integer part of any improper fraction should
! be first isolated and shown preceding the Egyptian unit fractions, and
! be surrounded by square brackets [n].
! 
! Task requirements:
! 
! -   show the Egyptian fractions for: $\tfrac{43}{48}$ and
!     $\tfrac{5}{121}$ and $\tfrac{2014}{59}$
! -   for all proper fractions, $\tfrac{a}{b}$ where a and b are positive
!     one-or two-digit (decimal) integers, find and show an Egyptian
!     fraction that has:
!     -   -   the largest number of terms,
!         -   the largest denominator.
! -   for all one-, two-, and three-digit integers, find and show (as
!     above). {extra credit}
! 
! Also see:
! 
! -   Wolfram MathWorld™ entry: Egyptian fraction
! -   Numberphile YouTube video: Egyptian Fractions and the Greedy
!     Algorithm

USING: backtrack formatting fry kernel locals make math
math.functions math.ranges sequences ;
IN: rosetta-code.egyptian-fractions

: >improper ( r -- str ) >fraction "%d/%d" sprintf ;

: improper ( x y -- a b ) [ /i ] [ [ rem ] [ nip ] 2bi / ] 2bi ;

:: proper ( x y -- a b )
    y x / ceiling :> d1 1 d1 / y neg x rem y d1 * / ;
    
: expand ( a -- b c )
    >fraction 2dup > [ improper ] [ proper ] if ;

: egyptian-fractions ( x -- seq )
    [ [ expand [ , ] dip dup 0 = not ] loop drop ] { } make ;

: part1 ( -- )
    43/48 5/121 2014/59 [
        [ >improper ] [ egyptian-fractions ] bi
        "%s => %[%u, %]\n" printf
    ] tri@ ;

: all-longest ( seq -- seq )
    dup longest length '[ length _ = ] filter ;

: (largest-denominator) ( seq -- n )
    [ denominator ] map supremum ;

: most-terms ( seq -- )
    all-longest [ [ sum ] map ] [ first length ] bi
    "most terms: %[%u, %] => %d\n" printf ;

: largest-denominator ( seq -- )
    [ (largest-denominator) ] supremum-by
    [ sum ] [ (largest-denominator) ] bi
    "largest denominator: %u => %d\n" printf ;

: part2 ( -- )
    [
        99 [1,b] amb-lazy dup [1,b] amb-lazy swap /
        egyptian-fractions
    ] bag-of [ most-terms ] [ largest-denominator ] bi ;

: egyptian-fractions-demo ( -- ) part1 part2 ;

MAIN: egyptian-fractions-demo
