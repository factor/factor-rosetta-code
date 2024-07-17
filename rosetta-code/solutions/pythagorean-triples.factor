! A Pythagorean triple is defined as three positive integers (a, b, c)
! where a < b < c, and a² + b² = c².
! 
! They are called primitive triples if a, b, c are co-prime, that is, if
! their pairwise greatest common divisors
! ${\rm gcd}(a, b) = {\rm gcd}(a, c) = {\rm gcd}(b, c) = 1$.
! 
! Because of their relationship through the Pythagorean theorem, a, b, and
! c are co-prime if a and b are co-prime (${\rm gcd}(a, b) = 1$).
! 
! Each triple forms the length of the sides of a right triangle, whose
! perimeter is P = a + b + c.
! 
! Task:
! 
! The task is to determine how many Pythagorean triples there are with a
! perimeter no larger than 100 and the number of these that are primitive.
! 
! Extra credit:
! 
! Deal with large values. Can your program handle a maximum perimeter of
! 1,000,000? What about 10,000,000? 100,000,000?
! 
! Note: the extra credit is not for you to demonstrate how fast your
! language is compared to others; you need a proper algorithm to solve
! them in a timely manner.
! 
! Related tasks:
! 
! -   Euler's sum of powers conjecture
! -   List comprehensions
! -   Pythagorean quadruples

USING: accessors arrays formatting kernel literals math
math.functions math.matrices math.ranges sequences ;
IN: rosettacode.pyth

CONSTANT: T1 { 
  {  1  2  2 }
  { -2 -1 -2 }
  {  2  2  3 }
}
CONSTANT: T2 {
  {  1  2  2 }
  {  2  1  2 }
  {  2  2  3 }
}
CONSTANT: T3 {
  { -1 -2 -2 }
  {  2  1  2 }
  {  2  2  3 }
}

CONSTANT: base { 3 4 5 }

TUPLE: triplets-count primitives total ;
: <0-triplets-count> ( -- a ) 0 0 \ triplets-count boa ;
: next-triplet ( triplet T -- triplet' ) [ 1array ] [ m. ] bi* first ;
: candidates-triplets ( seed -- candidates )
  ${ T1 T2 T3 } [ next-triplet ] with map ;
: add-triplets ( current-triples limit triplet -- stop )
  sum 2dup > [
   /i [ + ] curry change-total
   [ 1 + ] change-primitives drop t 
  ] [ 3drop f ] if ;
: all-triplets ( current-triples limit seed -- triplets )
  3dup add-triplets [ 
    candidates-triplets [ all-triplets ] with swapd reduce
  ] [ 2drop ] if ;
: count-triplets ( limit -- count )
  <0-triplets-count> swap base all-triplets ;
: pprint-triplet-count ( limit count -- )
  [ total>> ] [ primitives>> ] bi 
  "Up to %d: %d triples, %d primitives.\n" printf ;
: pyth ( -- )
  8 [1,b] [ 10^ dup count-triplets pprint-triplet-count ] each ;
