! A vector is defined as having three dimensions as being represented by
! an ordered collection of three numbers: (X, Y, Z).
! 
! If you imagine a graph with the x and y axis being at right angles to
! each other and having a third, z axis coming out of the page, then a
! triplet of numbers, (X, Y, Z) would represent a point in the region, and
! a vector from the origin to the point.
! 
! Given the vectors:
! 
!         A = (a¹,  a²,  a³) 
!         B = (b¹,  b²,  b³) 
!         C = (c¹,  c²,  c³) 
! 
! then the following common vector products are defined:
! 
! -   The dot product (a scalar quantity)
! 
!     
! 
!          A • B = a₁b₁ + a₂b₂ + a₃b₃
! 
! -   The cross product (a vector quantity)
! 
!     
! 
!          A x B = (a₂b₃ - a₃b₂, a₃b₁ - a₁b₃, a₁b₂ - a₂b₁)
! 
! -   The scalar triple product (a scalar quantity)
! 
!     
! 
!          A • (B x C)
! 
! -   The vector triple product (a vector quantity)
! 
!     
! 
!          A x (B x C)
! 
! Task:
! 
! Given the three vectors:
! 
!         a = ( 3,    4,    5)
!         b = ( 4,    3,    5)
!         c = (-5,  -12,  -13)
! 
! 1.  Create a named function/subroutine/method to compute the dot product
!     of two vectors.
! 2.  Create a function to compute the cross product of two vectors.
! 3.  Optionally create a function to compute the scalar triple product of
!     three vectors.
! 4.  Optionally create a function to compute the vector triple product of
!     three vectors.
! 5.  Compute and display: a • b
! 6.  Compute and display: a x b
! 7.  Compute and display: a • (b x c), the scalar triple product.
! 8.  Compute and display: a x (b x c), the vector triple product.
! 
! References:
! 
! -   A starting page on Wolfram MathWorld is .
! -   Wikipedia dot product.
! -   Wikipedia cross product.
! -   Wikipedia triple product.
! 
! Related tasks:
! 
! -   Dot product
! -   Quaternion type

USING: arrays io locals math prettyprint sequences ;

: dot-product ( a b -- dp ) [ * ] 2map sum ;

:: cross-product ( a b -- cp )
    a first :> a1 a second :> a2 a third :> a3
    b first :> b1 b second :> b2 b third :> b3
    a2 b3 * a3 b2 * - ! X
    a3 b1 * a1 b3 * - ! Y
    a1 b2 * a2 b1 * - ! Z
    3array ;

: scalar-triple-product ( a b c -- stp )
    cross-product dot-product ;

: vector-triple-product ( a b c -- vtp )
    cross-product cross-product ;

[let
    { 3 4 5 }      :> a
    { 4 3 5 }      :> b
    { -5 -12 -13 } :> c
    "a: " write a .
    "b: " write b .
    "c: " write c . nl
    "a . b: " write a b dot-product .
    "a x b: " write a b cross-product .
    "a . (b x c): " write a b c scalar-triple-product .
    "a x (b x c): " write a b c vector-triple-product .
]
