! Quaternions are an extension of the idea of complex numbers.
! 
! A complex number has a real and complex part, sometimes written as
! a + bi,
! 
! where a and b stand for real numbers, and i stands for the square root
! of minus 1.
! 
! An example of a complex number might be -3 + 2i,
! 
! where the real part, a is -3.0 and the complex part, b is +2.0.
! 
! A quaternion has one real part and three imaginary parts, i, j, and k.
! 
! A quaternion might be written as a + bi + cj + dk.
! 
! In the quaternion numbering system:
! 
! -   -    i∙i = j∙j = k∙k = i∙j∙k = -1, or more simply,
!     -    ii  = jj  = kk  = ijk = -1.
! 
! The order of multiplication is important, as, in general, for two
! quaternions:
! 
!          q¹ and q²: q¹q² ≠ q²q¹.
! 
! An example of a quaternion might be 1 +2i +3j +4k
! 
! There is a list form of notation where just the numbers are shown and
! the imaginary multipliers i, j, and k are assumed by position.
! 
! So the example above would be written as (1, 2, 3, 4)
! 
! Task:
! 
! Given the three quaternions and their components:
! 
!    q  = (1, 2, 3, 4) = (a, b, c, d)
!    q¹ = (2, 3, 4, 5) = (a¹, b¹, c¹, d¹)
!    q² = (3, 4, 5, 6) = (a², b², c², d²) 
! 
! And a wholly real number r = 7.
! 
! Create functions (or classes) to perform simple maths with quaternions
! including computing:
! 
! 1.  The norm of a quaternion:
! 
! $= \sqrt{a^2 + b^2 + c^2 + d^2}$
! 
! 1.  The negative of a quaternion:
! 
!  = (-a, -b, -c, -d)  
! 
! 1.  The conjugate of a quaternion:
! 
!  = ( a, -b, -c, -d)  
! 
! 1.  Addition of a real number r and a quaternion q:
! 
!  r + q = q + r = (a+r, b, c, d) 
! 
! 1.  Addition of two quaternions:
! 
!  q¹ + q² = (a¹+a², b¹+b², c¹+c², d¹+d²) 
! 
! 1.  Multiplication of a real number and a quaternion:
! 
!  qr = rq = (ar, br, cr, dr) 
! 
! 1.  Multiplication of two quaternions q¹ and q² is given by:
! 
!  ( a¹a² − b¹b² − c¹c² − d¹d², 
! a¹b² + b¹a² + c¹d² − d¹c², 
! a¹c² − b¹d² + c¹a² + d¹b², 
! a¹d² + b¹c² − c¹b² + d¹a² ) 
! 
! 1.  Show that, for the two quaternions q¹ and q₂:
! 
! q¹q² ≠ q²q¹  
! 
! If a language has built-in support for quaternions, then use it.
! 
! C.f.:
! 
! -   Vector products
! -   On Quaternions; or on a new System of Imaginaries in Algebra. By Sir
!     William Rowan Hamilton LL.D, P.R.I.A., F.R.A.S., Hon. M. R. Soc. Ed.
!     and Dub., Hon. or Corr. M. of the Royal or Imperial Academies of St.
!     Petersburgh, Berlin, Turin and Paris, Member of the American Academy
!     of Arts and Sciences, and of other Scientific Societies at Home and
!     Abroad, Andrews' Prof. of Astronomy in the University of Dublin, and
!     Royal Astronomer of Ireland.

USING: generalizations io kernel locals math.quaternions
math.vectors prettyprint sequences ;
IN: rosetta-code.quaternion-type

: show ( quot -- )
    [ unparse 2 tail but-last "= " append write ] [ call . ] bi
    ; inline

: 2show ( quots -- )
    [ 2curry show ] map-compose [ call ] each ; inline

: q+n ( q n -- q+n ) n>q q+ ;

[let
    { 1 2 3 4 } 7 { 2 3 4 5 } { 3 4 5 6 } :> ( q r q1 q2 )
    q [ norm ]
    q [ vneg ]
    q [ qconjugate ]
    [ curry show ] 2tri@
    {
        [ q  r  [ q+n ] ]
        [ q  r  [ q*n ] ]
        [ q1 q2 [ q+  ] ]
        [ q1 q2 [ q*  ] ]
        [ q2 q1 [ q*  ] ]
    } 2show
]
