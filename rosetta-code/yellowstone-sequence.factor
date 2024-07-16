! The Yellowstone sequence, also called the Yellowstone permutation, is
! defined as:
! 
! For n <= 3,
! 
!    a(n) = n
! 
! For n >= 4,
! 
!    a(n) = the smallest number not already in sequence such that a(n) is relatively prime to a(n-1) and 
!           is not relatively prime to a(n-2).
! 
! The sequence is a permutation of the natural numbers, and gets its name
! from what its authors felt was a spiking, geyser like appearance of a
! plot of the sequence.
! 
! Example:
! 
! a(4) is 4 because 4 is the smallest number following 1, 2, 3 in the
! sequence that is relatively prime to the entry before it (3), and is not
! relatively prime to the number two entries before it (2).
! 
! Task
!     Find and show as output the first  30Yellowstone numbers.
! 
! Extra
!     Demonstrate how to plot, with x = n and y coordinate a(n), the first
!     100 Yellowstone numbers.
! 
! Related tasks:
! 
! -   -   Greatest common divisor.
!     -   Plot coordinate pairs.
!     -   EKG sequence convergence
! 
! See also:
! 
! -   -   The OEIS entry: A098550 The Yellowstone permutation.
!     -   Applegate et al, 2015: The Yellowstone Permutation 1.

USING: accessors assocs colors.constants
combinators.short-circuit io kernel math prettyprint sequences
sets ui ui.gadgets ui.gadgets.charts ui.gadgets.charts.lines ;

: yellowstone? ( n hs seq -- ? )
    {
        [ drop in? not ]
        [ nip last gcd nip 1 = ]
        [ nip dup length 2 - swap nth gcd nip 1 > ]
    } 3&& ;

: next-yellowstone ( hs seq -- n )
    [ 4 ] 2dip [ 3dup yellowstone? ] [ [ 1 + ] 2dip ] until
    2drop ;

: next ( hs seq -- hs' seq' )
    2dup next-yellowstone [ suffix! ] [ pick adjoin ] bi ;

: <yellowstone> ( n -- seq )
    [ HS{ 1 2 3 } clone dup V{ } set-like ] dip dup 3 <=
    [ head nip ] [ 3 - [ next ] times nip ] if ;


! Show first 30 Yellowstone numbers.

"First 30 Yellowstone numbers:" print
30 <yellowstone> [ pprint bl ] each nl

! Plot first 100 Yellowstone numbers.

chart new { { 0 100 } { 0 175 } } >>axes
line new COLOR: blue >>color
100 <iota> 100 <yellowstone> zip >>data
add-gadget "Yellowstone numbers" open-window
