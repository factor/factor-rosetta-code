! When counting integers in binary, if you put a (binary) point to the
! right of the count then the column immediately to the left denotes a
! digit with a multiplier of 2⁰; the digit in the next column to the left
! has a multiplier of 2¹; and so on.
! 
! So in the following table:
! 
!       0.
!       1.
!      10.
!      11.
!      ...
! 
! the binary number "10" is 1 × 2¹ + 0 × 2⁰.
! 
! You can also have binary digits to the right of the “point”, just as in
! the decimal number system. In that case, the digit in the place
! immediately to the right of the point has a weight of 2⁻¹, or 1/2. The
! weight for the second column to the right of the point is 2⁻² or 1/4.
! And so on.
! 
! If you take the integer binary count of the first table, and reflect the
! digits about the binary point, you end up with the van der Corput
! sequence of numbers in base 2.
! 
!       .0
!       .1
!       .01
!       .11
!       ...
! 
! The third member of the sequence, binary 0.01, is therefore
! 0 × 2⁻¹ + 1 × 2⁻² or 1/4.
! 
! [400|thumb|right|Distribution of 2500 points each: Van der Corput (top) vs pseudorandom] Members of the sequence lie within the interval 0 ≤ x < 1. Points within the sequence tend to be evenly distributed which is a useful trait to have for Monte Carlo simulations. 
! 
! This sequence is also a superset of the numbers representable by the
! "fraction" field of an old IEEE floating point standard. In that
! standard, the "fraction" field represented the fractional part of a
! binary number beginning with "1." e.g. 1.101001101.
! 
! Hint
! 
! A hint at a way to generate members of the sequence is to modify a
! routine used to change the base of an integer:
! 
!     >>> def base10change(n, base):
!         digits = []
!         while n:
!             n,remainder = divmod(n, base)
!             digits.insert(0, remainder)
!         return digits
! 
!     >>> base10change(11, 2)
!     [1, 0, 1, 1]
! 
! the above showing that 11 in decimal is
! 1 × 2³ + 0 × 2² + 1 × 2¹ + 1 × 2⁰.
! 
! Reflected this would become .1101 or
! 1 × 2⁻¹ + 1 × 2⁻² + 0 × 2⁻³ + 1 × 2⁻⁴
! 
! Task description:
! 
! -   Create a function/method/routine that given n, generates the n'th
!     term of the van der Corput sequence in base 2.
! -   Use the function to compute and display the first ten members of the
!     sequence. (The first member of the sequence is for n=0).
! 
! -   As a stretch goal/extra credit, compute and show members of the
!     sequence for bases other than 2.
! 
! See also:
! 
! -   The Basic Low Discrepancy Sequences
! -   Non-decimal radices/Convert
! -   Van der Corput sequence

USING: formatting fry io kernel math math.functions math.parser
math.ranges sequences ;
IN: rosetta-code.van-der-corput

: vdc ( n base -- x )
    [ >base string>digits <reversed> ]
    [ nip '[ 1 + neg _ swap ^ * ] ] 2bi map-index sum ;

: vdc-demo ( -- )
    2 5 [a,b] [
        dup "Base %d: " printf 10 <iota>
        [ swap vdc "%-5u " printf ] with each nl
    ] each ;

MAIN: vdc-demo
