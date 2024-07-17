! Task:
! 
! Create a program that calculates the hour, sun hour angle, dial hour
! line angle from 6am to 6pm for an operator entered location.
! 
! For example, the user is prompted for a location and inputs the latitude
! and longitude 4°57′S 150°30′W (4.95°S 150.5°W of Jules Verne's Lincoln
! Island, aka Ernest Legouve Reef), with a legal meridian of 150°W.
! 
! (Note: the "meridian" is approximately the same concept as the
! "longitude" - the distinction is that the meridian is used to determine
! when it is "noon" for official purposes. This will typically be slightly
! different from when the sun appears at its highest location, because of
! the structure of time zones. For most, but not all, time zones (hour
! wide zones with hour zero centred on Greenwich), the legal meridian will
! be an even multiple of 15 degrees.)
! 
! Wikipedia: A sundial is a device that measures time by the position of
! the Sun. In common designs such as the horizontal sundial, the sun casts
! a shadow from its style (also called its Gnomon, a thin rod or a sharp,
! straight edge) onto a flat surface marked with lines indicating the
! hours of the day (also called the dial face or dial plate). As the sun
! moves across the sky, the shadow-edge progressively aligns with
! different hour-lines on the plate. Such designs rely on the style being
! aligned with the axis of the Earth's rotation. Hence, if such a sundial
! is to tell the correct time, the style must point towards true north
! (not the north or south magnetic pole) and the style's angle with
! horizontal must equal the sundial's geographical latitude.
! 
! Category:Mathematics

USING: formatting io kernel locals math math.functions math.libm
math.parser math.ranges math.trig sequences ;
IN: rosetta-code.sundial

: get-num ( str -- x ) write flush readln string>number ;

: get-input ( -- lat lng ref )
    "Enter latitude: " "Enter longitude: "
    "Enter legal meridian: " [ get-num ] tri@ ;

: .diff ( lat lng ref -- )
    - [ deg>rad sin ] dip
    "sine of latitude: %.3f\ndiff longitude: %.3f\n" printf ;

: line-angle ( lat hra-rad -- hla )
    [ deg>rad sin ] [ [ sin * ] [ cos ] bi ] bi* fatan2 rad>deg
    ;

:: .angles ( lat lng ref -- )
    "Hour, sun hour angle, dial hour line angle from 6am to 6pm"
    print
    -6 6 [a,b] [
        :> h 15.0 h * :> hra!
        ref hra lng - + hra!
        lat hra deg>rad line-angle :> hla
        h hra hla
        "HR= %3d;  \t  HRA=%7.3f;  \t  HLA= %7.3f\n" printf
    ] each ;

: sundial-demo ( -- ) get-input nl 3dup .diff nl .angles ;

MAIN: sundial-demo
