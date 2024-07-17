! Task:
! 
! Find positive integers for which the base 16 (hexadecimal)
! representation does not contain any decimal digits '0'..'9', where n <
! 500₁₀

USING: kernel math.combinatorics math.parser prettyprint
sequences.extras ;

"ABCDEF" { 1 2 } [ [ hex> ] map-selections ] with map-concat .
