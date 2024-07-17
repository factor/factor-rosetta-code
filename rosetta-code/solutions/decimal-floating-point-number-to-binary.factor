! Task:
! 
! Create a program that takes a decimal floating point number and displays
! its binary representation and vice versa: takes a floating point binary
! number and outputs its decimal representation.
! 
! The output might be something like this:
! 
!        23.34375  => 10111.01011
!      1011.11101  =>    11.90625

USING: interpolate io kernel math.parser sequences ;

: bin>dec ( x -- y )
    number>string "0b${}p0" interpolate>string string>number ;

23.34375 dup >bin
1011.11101 dup bin>dec [ [I ${} => ${}I] nl ] 2bi@
