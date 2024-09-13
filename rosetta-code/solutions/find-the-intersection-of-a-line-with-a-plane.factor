! Finding the intersection of an infinite ray with a plane in 3D is an
! important topic in collision detection.
! 
! Task:
! 
! Find the point of intersection for the infinite ray with direction
! (0,-1,-1) passing through position (0,0,10) with the infinite plane with
! a normal vector of (0,0,1) and which passes through [0,0,5].
! 
! Category:Geometry Category:Collision detection

USING: io locals math.vectors prettyprint ;

:: intersection-point ( rdir rpt pnorm ppt -- loc )
    rpt rdir pnorm rpt ppt v- v. v*n rdir pnorm v. v/n v- ;

"The ray intersects the plane at " write
{ 0 -1 -1 } { 0 0 10 } { 0 0 1 } { 0 0 5 } intersection-point .
