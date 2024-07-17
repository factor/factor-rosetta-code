! Given a left-to-right ordered collection of e bits, b, where
! 1 <= e <= 10000, and a zero or more integer n :
! 
! -   Output the result of setting the n bits to the right of any set bit
!     in b
! 
! (if those bits are present in b and therefore also preserving the width,
! e).
! 
! Some examples:
! 
!    Set of examples showing how one bit in a nibble gets changed:
! 
!        n = 2; Width e = 4:
! 
!             Input b: 1000
!              Result: 1110
! 
!             Input b: 0100
!              Result: 0111
! 
!             Input b: 0010
!              Result: 0011
! 
!             Input b: 0000
!              Result: 0000
! 
!    Set of examples with the same input with set bits of varying distance apart:
! 
!        n = 0; Width e = 66:
! 
!             Input b: 010000000000100000000010000000010000000100000010000010000100010010
!              Result: 010000000000100000000010000000010000000100000010000010000100010010
! 
!        n = 1; Width e = 66:
! 
!             Input b: 010000000000100000000010000000010000000100000010000010000100010010
!              Result: 011000000000110000000011000000011000000110000011000011000110011011
! 
!        n = 2; Width e = 66:
! 
!             Input b: 010000000000100000000010000000010000000100000010000010000100010010
!              Result: 011100000000111000000011100000011100000111000011100011100111011111
! 
!        n = 3; Width e = 66:
! 
!             Input b: 010000000000100000000010000000010000000100000010000010000100010010
!              Result: 011110000000111100000011110000011110000111100011110011110111111111
! 
! Task:
! 
! -   Implement a routine to perform the setting of right-adjacent bits on
!     representations of bits that will scale over the given range of
!     input width e.
! -   Use it to show, here, the results for the input examples above.
! -   Print the output aligned in a way that allows easy checking by eye
!     of the binary input vs output.

USING: formatting io kernel math math.parser math.ranges
sequences ;

: set-rab ( n b -- result )
    [0,b] [ neg shift ] with [ bitor ] map-reduce ;

:: show ( n b e -- )
    b e "n = %d; width = %d\n" printf
    n n b set-rab [ >bin e CHAR: 0 pad-head print ] bi@ ;

{ 0b1000 0b0100 0b0010 0b0000 } [ 2 4 show nl ] each
0x10020080404082112 4 <iota> [ 66 show nl ] with each
