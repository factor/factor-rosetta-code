! Gray code is a form of binary encoding where transitions between
! consecutive numbers differ by only one bit. This is a useful encoding
! for reducing hardware data hazards with values that change rapidly
! and/or connect to slower hardware as inputs. It is also useful for
! generating inputs for Karnaugh maps in order from left to right or top
! to bottom.
! 
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

{ -1 "-1" "0" 0 }
{ 0 "0" "0" 0 }
{ 1 "1" "1" 1 }
{ 2 "10" "11" 2 }
{ 3 "11" "10" 3 }
{ 4 "100" "110" 4 }
{ 5 "101" "111" 5 }
{ 6 "110" "101" 6 }
{ 7 "111" "100" 7 }
{ 8 "1000" "1100" 8 }
{ 9 "1001" "1101" 9 }
{ 10 "1010" "1111" 10 }
{ 11 "1011" "1110" 11 }
{ 12 "1100" "1010" 12 }
{ 13 "1101" "1011" 13 }
{ 14 "1110" "1001" 14 }
{ 15 "1111" "1000" 15 }
{ 16 "10000" "11000" 16 }
{ 17 "10001" "11001" 17 }
{ 18 "10010" "11011" 18 }
{ 19 "10011" "11010" 19 }
{ 20 "10100" "11110" 20 }
{ 21 "10101" "11111" 21 }
{ 22 "10110" "11101" 22 }
{ 23 "10111" "11100" 23 }
{ 24 "11000" "10100" 24 }
{ 25 "11001" "10101" 25 }
{ 26 "11010" "10111" 26 }
{ 27 "11011" "10110" 27 }
{ 28 "11100" "10010" 28 }
{ 29 "11101" "10011" 29 }
{ 30 "11110" "10001" 30 }
{ 31 "11111" "10000" 31 }
{ 32 "100000" "110000" 32 }
