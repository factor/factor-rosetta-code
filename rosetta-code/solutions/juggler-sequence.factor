! Background of the juggler sequence:
! 
! Juggler sequences were publicized by an American mathematician and
! author Clifford A. Pickover. The name of the sequence gets it's name
! from the similarity of the rising and falling nature of the numbers in
! the sequences, much like balls in the hands of a juggler.
! 
! Description
! 
! A juggler sequence is an integer sequence that starts with a positive
! integer a[0], with each subsequent term in the sequence being defined by
! the recurrence relation:
! 
!             a[k + 1]  =  floor(a[k] ^ 0.5)    if a[k] is even   or      
!             a[k + 1]  =  floor(a[k] ^ 1.5)    if a[k] is odd                                   
! 
! If a juggler sequence reaches 1, then all subsequent terms are equal
! to 1. This is known to be the case for initial terms up to 1,000,000 but
! it is not known whether all juggler sequences after that will eventually
! reach 1.
! 
! Task:
! 
! Compute and show here the following statistics for juggler sequences
! with an initial term of a[n] where n is between 20 and 39 inclusive:
! 
! -   l[n] - the number of terms needed to reach 1.
! -   h[n] - the maximum value reached in that sequence.
! -   i[n] - the index of the term (starting from 0) at which the maximum
!     is (first) reached.
! 
! If your language supports big integers with an integer square root
! function, also compute and show here the same statistics for as many as
! you reasonably can of the following values for n:
! 
! 113, 173, 193, 2183, 11229, 15065, 15845, 30817, 48443, 275485, 1267909,
! 2264915, 5812827
! 
! Those with fast languages and fast machines may also like to try their
! luck at n = 7110201.
! 
! However, as h[n] for most of these numbers is thousands or millions of
! digits long, show instead of h[n]:
! 
! -   d[n] - the number of digits in h[n]
! 
! The results can be (partially) verified against the table here.
! 
! Related tasks:
! 
! -   Hailstone sequence
! -   Yellowstone sequence
! -   Isqrt_(integer_square_root)_of_X
! 
! See also:
! 
! -   oeis:A007320 Number of steps needed for Juggler sequence started at
!     n to reach 1
! -   oeis:A094716 Largest value in the Juggler sequence started at n

USING: combinators formatting generalizations io kernel math
math.extras math.functions.integer-logs math.order math.ranges
sequences strings tools.memory.private ;

: next ( m -- n )
    dup odd? [ dup dup * * ] when integer-sqrt ;

: new-max ( l i h a -- l i h a )
    [ drop dup ] 2dip nip dup ;

: (step) ( l i h a -- l i h a )
    [ 1 + ] 3dip 2dup < [ new-max ] when next ;

: step ( l i h a -- l i h a )
    dup 1 = [ (step) ] unless ;

: juggler ( n quot: ( h -- obj ) -- l i h )
    [ 0 0 ] [ dup [ step ] to-fixed-point drop ] [ call ] tri*
    [ 1 [-] ] dip ; inline

CONSTANT: fmt "%-8s %-8s %-8s %s\n"

: row. ( n quot -- )
    dupd juggler [ commas ] 4 napply fmt printf ; inline

: dashes. ( n -- )
    CHAR: - <string> print ;

: header. ( str -- )
    [ "n" "l[n]" "i[n]" ] dip fmt printf 45 dashes. ;

: juggler. ( seq quot str -- )
    header. [ row. ] curry each ; inline

20 39 [a,b] [ ] "h[n]" juggler. nl

{ 113 173 193 2183 11229 15065 15845 30817 }
[ integer-log10 1 + ] "d[n]" juggler.
