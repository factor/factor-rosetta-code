! Task:
! 
! Create a function/use an in-built function, to compute the dot product,
! also known as the scalar product of two vectors.
! 
! If possible, make the vectors of arbitrary length.
! 
! As an example, compute the dot product of the vectors:
! 
!     
! 
!          [1, 3, -5] and
!          [4, -2, -1]
! 
! If implementing the dot product of two vectors directly:
! 
! -   -   each vector must be the same length
!     -   multiply corresponding terms from each vector
!     -   sum the products (to produce the answer)
! 
! Related task:
! 
! -   Vector products

USING: kernel math.vectors sequences ;

: dot-product ( u v -- w )
    2dup [ length ] bi@ =
    [ v. ] [ "Vector lengths must be equal" throw ] if ;
