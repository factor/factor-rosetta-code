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

! rosetta/hailstone/length/length.factor
USING: assocs kernel io math math.ranges prettyprint
       rosetta.hailstone sequences ;
IN: rosetta.hailstone.length

<PRIVATE
: f>0 ( object/f -- object/0 )
    dup [ drop 0 ] unless ;

: max-value ( pair1 pair2 -- pair )
    [ [ second ] bi@ > ] most ;

: main ( -- )
    H{ } clone      ! Maps sequence length => count.
    1 100000 [a,b) [
        hailstone length                ! Find sequence length.
        over [ f>0 1 + ] change-at      ! Add 1 to count.
    ] each
    ! Find the length-count pair with the highest count.
    >alist unclip-slice [ max-value ] reduce
    first2 swap
    "Among Hailstone sequences from 1 <= n < 100000," print
    "there are " write pprint
    " sequences of length " write pprint "." print ;
PRIVATE>

MAIN: main
