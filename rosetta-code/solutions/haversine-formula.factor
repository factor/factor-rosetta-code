! The haversine formula is an equation important in navigation, giving
! great-circle distances between two points on a sphere from their
! longitudes and latitudes.
! 
! It is a special case of a more general formula in spherical
! trigonometry, the law of haversines, relating the sides and angles of
! spherical "triangles".
! 
! Task:
! 
! Implement a great-circle distance function, or use a library function,
! to show the great-circle distance between:
! 
! -   Nashville International Airport (BNA) in Nashville, TN, USA, which
!     is:
! 
!    N 36°7.2',   W 86°40.2'     (36.12,   -86.67)           -and-
! 
! -   Los Angeles International Airport (LAX) in Los Angeles, CA, USA,
!     which is:
! 
!    N 33°56.4',  W 118°24.0'    (33.94,  -118.40)   
! 
!     User Kaimbridge clarified on the Talk page:
! 
!      -- 6371.0 km is the authalic radius based on/extracted from surface area;
!      -- 6372.8 km is an approximation of the radius of the average circumference
!         (i.e., the average great-elliptic or great-circle radius), where the
!          boundaries are the meridian (6367.45 km) and the equator (6378.14 km).
! 
!     Using either of these values results, of course, in differing distances:
! 
!      6371.0 km -> 2886.44444283798329974715782394574671655 km;
!      6372.8 km -> 2887.25995060711033944886005029688505340 km;
!      (results extended for accuracy check:  Given that the radii are only
!       approximations anyways, .01' ≈ 1.0621333 km and .001" ≈ .00177 km,
!       practical precision required is certainly no greater than about
!       .0000001——i.e., .1 mm!)
! 
!     As distances are segments of great circles/circumferences, it is
!     recommended that the latter value (r = 6372.8 km) be used (which
!     most of the given solutions have already adopted, anyways). 
! 
! Most of the examples below adopted Kaimbridge's recommended value of
! 6372.8 km for the earth radius. However, the derivation of this
! ellipsoidal quadratic mean radius is wrong (the averaging over azimuth
! is biased). When applying these examples in real applications, it is
! better to use the mean earth radius, 6371 km. This value is recommended
! by the International Union of Geodesy and Geophysics and it minimizes
! the RMS relative error between the great circle and geodesic distance.

USING: arrays kernel math math.constants math.functions math.vectors sequences ;

: haversin ( x -- y ) cos 1 swap - 2 / ;
: haversininv ( y -- x ) 2 * 1 swap - acos ;
: haversineDist ( as bs -- d )
[ [ 180 / pi * ] map ] bi@
  [ [ swap - haversin ] 2map ]
  [ [ first cos ] bi@ * 1 swap 2array ]
  2bi
v.
haversininv R_earth * ;
