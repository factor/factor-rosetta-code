! Task:
! 
! Explicitly implement long multiplication.
! 
! This is one possible approach to arbitrary-precision integer algebra.
! 
! For output, display the result of 2⁶⁴ * 2⁶⁴.
! 
! Optionally, verify your result against builtin arbitrary precision
! support.
! 
! The decimal representation of 2⁶⁴ is:
! 
! 18,446,744,073,709,551,616
! 
! The output of 2⁶⁴ * 2⁶⁴ is 2¹²⁸, and is:
! 
! 340,282,366,920,938,463,463,374,607,431,768,211,456
! 
! Category:Arbitrary precision Category:Arithmetic operations

USING: kernel math sequences ;

: longmult-seq ( xs ys -- zs )
[ * ] cartesian-map
dup length iota [ 0 <repetition> ] map
[ prepend ] 2map
[ ] [ [ 0 suffix ] dip [ + ] 2map ] map-reduce ;

: integer->digits ( x -- xs )  { } swap  [ dup 0 > ] [ 10 /mod swap [ prefix ] dip ] while  drop ;
: digits->integer ( xs -- x )  0 [ swap 10 * + ] reduce ;

: longmult ( x y -- z )  [ integer->digits ] bi@ longmult-seq digits->integer ;
