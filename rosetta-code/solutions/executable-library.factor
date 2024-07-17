! The general idea behind an executable library is to create a library
! that when used as a library does one thing; but has the ability to be
! run directly via command line. Thus the API comes with a CLI in the very
! same source code file.
! 
! Task detail
! 
! -   Create a library/module/dll/shared object/... for a programming
!     language that contains a function/method called hailstone that is a
!     function taking a positive integer and returns the Hailstone
!     sequence for that number.
! 
! -   The library, when executed directly should satisfy the remaining
!     requirements of the Hailstone sequence task:
! 
!     
! 
!         2. Use the routine to show that the hailstone sequence for the
!         number 27 has 112 elements starting with 27, 82, 41, 124 and
!         ending with 8, 4, 2, 1
!         3. Show the number less than 100,000 which has the longest
!         hailstone sequence together with that sequence's length.
! 
! -   Create a second executable to calculate the following:
!     -   Use the library's hailstone function, in the standard manner,
!         (or document how this use deviates from standard use of a
!         library), together with extra code in this executable, to find
!         the hailstone length returned most often for 1 ≤ n < 100,000.
! 
! -   Explain any extra setup/run steps needed to complete the task.
! 
! Notes:
! 
! -   It is assumed that for a language that overwhelmingly ships in a
!     compiled form, such as C, the library must also be an executable and
!     the compiled user of that library is to do so without changing the
!     compiled library. I.e. the compile tool-chain is assumed not to be
!     present in the runtime environment.
! -   Interpreters are present in the runtime environment.

! rosetta/hailstone/hailstone.factor
USING: arrays io kernel math math.ranges prettyprint sequences vectors ;
IN: rosetta.hailstone

: hailstone ( n -- seq )
    [ 1vector ] keep
    [ dup 1 number= ]
    [
        dup even? [ 2 / ] [ 3 * 1 + ] if
        2dup swap push
    ] until
    drop ;

<PRIVATE
: main ( -- )
    27 hailstone dup dup
    "The hailstone sequence from 27:" print
    "  has length " write length .
    "  starts with " write 4 head [ unparse ] map ", " join print
    "  ends with " write 4 tail* [ unparse ] map ", " join print

    ! Maps n => { length n }, and reduces to longest Hailstone sequence.
    1 100000 [a,b)
    [ [ hailstone length ] keep 2array ]
    [ [ [ first ] bi@ > ] most ] map-reduce
    first2
    "The hailstone sequence from " write pprint
    " has length " write pprint "." print ;
PRIVATE>

MAIN: main
