! Related tasks:
! 
! -   Arrays
! -   Vector
!     -   Dot product
!     -   Vector products
! -   Matrices
! -   Bivector
! -   Antivector
! -   Tensor
! -   Quaternion
! -   Rotor
! -   Motor
! -   Sedenion
! -   Octonion
! 
! Task
! 
! Implement a Vector class (or a set of functions) that models a Physical
! Vector. The four basic operations and a pretty print function should be
! implemented.
! 
! The Vector may be initialized in any reasonable way.
! 
! -   Start and end points, and direction
! -   Angular coefficient and value (length)
! 
! The four operations to be implemented are:
! 
! -   Vector  + Vector addition
! -   Vector  - Vector subtraction
! -   Vector  * scalar multiplication
! -   Vector / scalar division

(scratchpad) USE: math.vectors
(scratchpad) { 1 2 } { 3 4 } v+

--- Data stack:
{ 4 6 }

USING: accessors arrays kernel math parser prettyprint
prettyprint.custom sequences ;
IN: rosetta-code.vector

TUPLE: vec { x real read-only } { y real read-only } ;
C: <vec> vec

<PRIVATE

: parts ( vec -- x y ) [ x>> ] [ y>> ] bi ;
: devec ( vec1 vec2 -- x1 y1 x2 y2 ) [ parts ] bi@ rot swap ;

: binary-op ( vec1 vec2 quot -- vec3 )
    [ devec ] dip 2bi@ <vec> ; inline  
    
: scalar-op ( vec1 scalar quot -- vec2 )
    [ parts ] 2dip curry bi@ <vec> ; inline
    
PRIVATE>

SYNTAX: VEC{ \ } [ first2 <vec> ] parse-literal ;
    
: v+ ( vec1 vec2   -- vec3 ) [ + ] binary-op ;
: v- ( vec1 vec2   -- vec3 ) [ - ] binary-op ;
: v* ( vec1 scalar -- vec2 ) [ * ] scalar-op ;
: v/ ( vec1 scalar -- vec2 ) [ / ] scalar-op ;

M: vec pprint-delims drop \ VEC{ \ } ;
M: vec >pprint-sequence parts 2array ;
M: vec pprint* pprint-object ;

USING: kernel formatting prettyprint rosetta-code.vector
sequences ;
IN: rosetta-code.vector

: demo ( a b quot -- )
    3dup [ unparse ] tri@ rest but-last
    "%16s %16s%3s= " printf call . ; inline

VEC{ -8.4 1.35 } VEC{ 10 11/123 } [ v+ ] demo
VEC{ 5 3 } VEC{ 4 2 } [ v- ] demo
VEC{ 4 -8 } 2 [ v* ] demo
VEC{ 5 7 } 2 [ v/ ] demo

! You can still make a vector without the literal syntax of
! course.

5 2 <vec> 1.3 [ v* ] demo
