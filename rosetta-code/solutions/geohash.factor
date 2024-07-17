! Geohashes are used to represent standard latitude and longitude
! coordinates as single values in the form of a simple string -- using the
! digits (0-9) and the letters (B-Z excluding I, L, O). They can vary in
! length, with more characters in the string representing more precision.
! 
! Task
! 
! Generate a Geohash with a desired precision from a coordinate
! represented as an array of two floating point numbers, latitude and
! longitude. (Ideally double precision).
! 
! Example 1:
!     print (encodeGeohash (for: [51.433718, -0.214126], withPrecision:
!     2))
!     // Result: "gc" (all of Ireland, most of England and Wales, small
!     part of Scotland)
! 
! Example 2:
!     print (encodeGeohash (for: [51.433718, -0.214126], withPrecision:
!     9))
!     // Result: "gcpue5hp4" (the umpire's chair on Center Court at
!     Wimbledon)
! 
! From the Wikipedia page, geohashes can be "useful in database systems
! where queries on a single index are much easier or faster than
! multiple-index queries."
! 
! Extra credit
! 
! Provide a decode function to convert a geohash code back to latitude and
! longitude, expressed either as ranges or in median +/- deviation format.
! 
! Reference
! 
! -   Wikipedia article - Geohash.

USING: formatting generalizations geohash io kernel sequences ;

: encode-geohash ( latitude longitude precision -- str )
    [ >geohash ] [ head ] bi* ;

! Encoding
51.433718 -0.214126 2
51.433718 -0.214126 9
57.649110 10.407440 11
[
    3dup encode-geohash
    "geohash for [%f, %f], precision %2d = %s\n" printf
] 3 3 mnapply nl

! Decoding
"u4pruydqqvj" dup geohash>
"coordinates for %s ~= [%f, %f]\n" printf
