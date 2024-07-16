! Avast me hearties!
! 
! There be many a land lubber that knows naught of the pirate ways and
! gives direction by degree! They know not how to box the compass!
! 
! Task description:
! 
! 1.  Create a function that takes a heading in degrees and returns the
!     correct 32-point compass heading.
! 2.  Use the function to print and display a table of Index, Compass
!     point, and Degree; rather like the corresponding columns from, the
!     first table of the wikipedia article, but use only the following 33
!     headings as input:
! 
!     [0.0, 16.87, 16.88, 33.75, 50.62, 50.63, 67.5, 84.37, 84.38, 101.25, 118.12, 118.13, 135.0, 151.87, 151.88, 168.75, 185.62, 185.63, 202.5, 219.37, 219.38, 236.25, 253.12, 253.13, 270.0, 286.87, 286.88, 303.75, 320.62, 320.63, 337.5, 354.37, 354.38].
!     (They should give the same order of points but are spread throughout
!     the ranges of acceptance).
! 
! Notes;
! 
! -   The headings and indices can be calculated from this pseudocode:
! 
!     for i in 0..32 inclusive:
!         heading = i * 11.25
!         case i %3:
!           if 1: heading += 5.62; break
!           if 2: heading -= 5.62; break
!         end
!         index = ( i mod 32) + 1
! 
! -   The column of indices can be thought of as an enumeration of the
!     thirty two cardinal points (see talk page)..

USING: formatting kernel math sequences ;

CONSTANT: box
{
    "North" "North by east" "North-northeast"
    "Northeast by north" "Northeast" "Northeast by east"
    "East-northeast" "East by north" "East" "East by south"
    "East-southeast" "Southeast by east" "Southeast"
    "Southeast by south" "South-southeast" "South by east"
    "South" "South by west" "South-southwest"
    "Southwest by south" "Southwest" "Southwest by west"
    "West-southwest" "West by south" "West" "West by north"
    "West-northwest" "Northwest by west" "Northwest"
    "Northwest by north" "North-northwest" "North by west"
}

{
    0 16.87 16.88 33.75 50.62 50.63 67.5 84.37 84.38 101.25
    118.12 118.13 135 151.87 151.88 168.75 185.62 185.63 202.5
    219.37 219.38 236.25 253.12 253.13 270 286.87 286.88 303.75
    320.62 320.63 337.5 354.37 354.38
}

[
    dup 32 * 360 /f 0.5 + >integer 32 mod [ 1 + ] [ box nth ] bi
    "%6.2f°  %2d  %s\n" printf
] each
