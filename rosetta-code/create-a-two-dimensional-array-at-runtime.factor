! Get two integers from the user, then create a two-dimensional array
! where the two dimensions have the sizes given by those numbers, and
! which can be accessed in the most natural way possible. Write some
! element of that array, and then output that element. Finally destroy the
! array if not done by the language itself.

USING: io kernel math.matrices math.parser prettyprint
sequences ;
IN: rosettacode.runtime2darray

: set-Mi,j ( elt {i,j} matrix -- )
[ first2 swap ] dip nth set-nth ;
: Mi,j ( {i,j} matrix -- elt ) 
[ first2 swap ] dip nth nth ;

: example ( -- ) 
readln readln [ string>number ] bi@ zero-matrix ! create the array
[ [ 42 { 0 0 } ] dip set-Mi,j ] ! set the { 0 0 } element to 42
[ [ { 0 0 } ] dip Mi,j . ] ! read the { 0 0 } element
bi ;
