! Finding the intersection of two lines that are in the same plane is an
! important topic in collision detection.[1]
! 
! Task:
! 
! Find the point of intersection of two lines in 2D.
! 
! The 1^(st) line passes though (4,0) and (6,10) .
! 
! The 2^(nd) line passes though (0,3) and (10,7) .
! 
! Category:Geometry Category:Collision detection
! 
! [1] 1

USING: arrays combinators.extras kernel math
math.matrices.laplace math.vectors prettyprint sequences ;

: det ( pt pt -- x ) 2array determinant ;

: numerator ( x y pt pt quot -- z )
    bi@ swapd [ 2array ] 2bi@ det ; inline

: intersection ( pt pt pt pt -- pt )
    [ [ det ] 2bi@ ]
    [ [ v- ] 2bi@ ] 4bi
    [ [ first ] numerator ]
    [ [ second ] numerator ]
    [ det 2nip ] 4tri
    dup zero? [ 3drop { 0/0. 0/0. } ]
    [ tuck [ / ] 2bi@ 2array ] if ;

{ 4 0 } { 6 10 } { 0 3 } { 10 7 } intersection .
{ 4 0 } { 6 10 } { 0 3 } { 10 7+1/10 } intersection .
{ 0 0 } { 1 1 } { 1 2 } { 4 5 } intersection .
