! Create functions to encode a number to and decode a number from Gray
! code.
! 
! Display the normal binary representations, Gray code representations,
! and decoded Gray code values for all 5-bit binary numbers (0-31
! inclusive, leading 0's not necessary).
! 
! There are many possible Gray codes. The following encodes what is called
! "binary reflected Gray code."
! 
! Encoding (MSB is bit 0, b is binary, g is Gray code):
! 
!     if b[i-1] = 1
!        g[i] = not b[i]
!     else
!        g[i] = b[i]
! 
! Or:
! 
!     g = b xor (b logically right shifted 1 time)
! 
! Decoding (MSB is bit 0, b is binary, g is Gray code):
! 
!     b[0] = g[0]
! 
!     for other bits:
!     b[i] = g[i] xor b[i-1]
! 
! Reference
! 
! -   Converting Between Gray and Binary Codes. It includes step-by-step
!     animations.

USING: math.ranges locals ;
IN: rosetta-gray

: gray-encode ( n -- n' ) dup -1 shift bitxor ;

:: gray-decode ( n! -- n' )
   n :> p!
   [ n -1 shift dup n! 0 = not ] [ 
     p n bitxor p! 
   ] while
   p ;

: main ( -- ) 
  -1 32 [a,b] [ dup [ >bin ] [ gray-encode ] bi [ >bin ] [ gray-decode ] bi 4array . ] each ;

MAIN: main

