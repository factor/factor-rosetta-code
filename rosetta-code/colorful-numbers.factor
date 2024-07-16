! A colorful number is a non-negative base 10 integer where the product of
! every sub group of consecutive digits is unique.
! 
! E.G.
! 
! 24753 is a colorful number. 2, 4, 7, 5, 3, (2×4)8, (4×7)28, (7×5)35,
! (5×3)15, (2×4×7)56, (4×7×5)140, (7×5×3)105, (2×4×7×5)280, (4×7×5×3)420,
! (2×4×7×5×3)840
! 
! Every product is unique.
! 
! 2346 is not a colorful number. 2, 3, 4, 6, (2×3)6, (3×4)12, (4×6)24,
! (2×3×4)48, (3×4×6)72, (2×3×4×6)144
! 
! The product 6 is repeated.
! 
! Single digit numbers are considered to be colorful. A colorful number
! larger than 9 cannot contain a repeated digit, the digit 0 or the
! digit 1. As a consequence, there is a firm upper limit for colorful
! numbers; no colorful number can have more than 8 digits.
! 
! Task
! 
! -   Write a routine (subroutine, function, procedure, whatever it may be
!     called in your language) to test if a number is a colorful number or
!     not.
! -   Use that routine to find all of the colorful numbers less than 100.
! -   Use that routine to find the largest possible colorful number.
! 
! Stretch
! 
! -   Find and display the count of colorful numbers in each order of
!     magnitude.
! -   Find and show the total count of all colorful numbers.
! 
! Colorful numbers have no real number theory application. They are more a
! recreational math puzzle than a useful tool.

USING: assocs grouping grouping.extras io kernel literals math
math.combinatorics math.ranges prettyprint project-euler.common
sequences sequences.extras sets ;

CONSTANT: digits $[ 2 9 [a..b] ]

: (colorful?) ( seq -- ? )
    all-subseqs [ product ] map all-unique? ;

: colorful? ( n -- ? )
    [ t ] [ number>digits (colorful?) ] if-zero ;

: table. ( seq cols -- )
    [ "" pad-groups ] keep group simple-table. ;

: (oom-count) ( n -- count )
    digits swap <k-permutations> [ (colorful?) ] count ;

: oom-count ( n -- count )
    dup 1 = [ drop 10 ] [ (oom-count) ] if ;

"Colorful numbers under 100:" print
100 <iota> [ colorful? ] filter 10 table. nl

"Largest colorful number:" print
digits <permutations> [ (colorful?) ] find-last nip digits>number . nl

"Count of colorful numbers by number of digits:" print
8 [1..b] [ oom-count ] zip-with dup .
"Total: " write values sum .
