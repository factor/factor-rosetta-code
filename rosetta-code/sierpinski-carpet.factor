! Task
! 
! Produce a graphical or ASCII-art representation of a Sierpinski carpet
! of order N.
! 
! For example, the Sierpinski carpet of order 3 should look like this:
! 
!     ###########################
!     # ## ## ## ## ## ## ## ## #
!     ###########################
!     ###   ######   ######   ###
!     # #   # ## #   # ## #   # #
!     ###   ######   ######   ###
!     ###########################
!     # ## ## ## ## ## ## ## ## #
!     ###########################
!     #########         #########
!     # ## ## #         # ## ## #
!     #########         #########
!     ###   ###         ###   ###
!     # #   # #         # #   # #
!     ###   ###         ###   ###
!     #########         #########
!     # ## ## #         # ## ## #
!     #########         #########
!     ###########################
!     # ## ## ## ## ## ## ## ## #
!     ###########################
!     ###   ######   ######   ###
!     # #   # ## #   # ## #   # #
!     ###   ######   ######   ###
!     ###########################
!     # ## ## ## ## ## ## ## ## #
!     ###########################
! 
! The use of the # character is not rigidly required for ASCII art.
! 
! The important requirement is the placement of whitespace and
! non-whitespace characters.
! 
! Related task:
! 
! -   Sierpinski triangle

USING: kernel math math.matrices prettyprint ;

: sierpinski ( n -- )
    1 - { { 1 1 1 } { 1 0 1 } { 1 1 1 } } swap over [ kron ]
    curry times [ 1 = "#" " " ? ] matrix-map simple-table. ;

3 sierpinski
