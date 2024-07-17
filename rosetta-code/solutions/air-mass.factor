! In astronomy air mass is a measure of the amount of atmosphere between
! the observer and the object being observed. It is a function of the
! zenith angle (the angle between the line of sight an vertical) and the
! altitude of the observer. It is defined as the integral of the
! atmospheric density along the line of sight and is usually expressed
! relative to the air mass at zenith. Thus, looking straight up gives an
! air mass of one (regardless of observer's altitude) and viewing at any
! zenith angle greater than zero gives higher values.
! 
! You will need to integrate ρ(h(a,z,x)) where ρ(h) is the atmospheric
! density for a given height above sea level, and h(a,z,x) is the height
! above sea level for a point at distance x along the line of sight.
! Determining this last function requires some trigonometry.
! 
! For this task you can assume:
! 
! -   -   The density of Earth's atmosphere is proportional to exp(-a/8500
!         metres)
!     -   The Earth is a perfect sphere of radius 6731 km.
! 
! Task:
! 
! -   -   Write a function that calculates the air mass for an observer at
!         a given altitude a above sea level and zenith angle z.
!     -   Show the air mass for zenith angles 0 to 90 in steps of 5
!         degrees for an observer at sea level.
!     -   Do the same for the NASA SOFIA infrared telescope, which has a
!         cruising altitude of 13,700 meters (about 8.3 miles),
! 
!     
! 
!         it flies in a specially retrofitted Boeing 747 about four
!         flights a week.

USING: formatting io kernel math math.functions math.order
math.ranges math.trig sequences ;

CONSTANT: RE 6,371,000     ! Earth's radius in meters
CONSTANT: dd 0.001         ! integrate in this fraction of the distance already covered
CONSTANT: FIN 10,000,000   ! integrate to a height of 10000km

! the density of air as a function of height above sea level
: rho ( a -- x ) neg 8500 / e^ ;

! z = zenith angle (in degrees)
! d = distance along line of sight
! a = altitude of observer
:: height ( a z d -- x )
    RE a + :> AA
    AA sq d sq + 180 z - deg>rad cos AA * d * 2 * - sqrt RE - ;

:: column-density ( a z -- x )
    ! integrates along the line of sight
    0 0 :> ( s! d! )
    [ d FIN < ] [
        dd dd d * max :> delta   ! adaptive step size to avoid taking it forever
        s a z d 0.5 delta * + height rho delta * + s!
        d delta + d!
    ] while s ;

: airmass ( a z -- x )
    [ column-density ] [ drop 0 column-density ] 2bi / ;

"Angle     0 m              13700 m" print
"------------------------------------" print
0 90 5 <range> [
    dup [ 0 swap airmass ] [ 13700 swap airmass ] bi
    "%2d %15.8f %17.8f\n" printf
] each
