! Task:
! 
! Find and display (here on this page) positive integers, n, whose base 2
! representation is the concatenation of two identical binary strings,
! 
! where n < 1,000₁₀''' (one thousand).
! 
! For each such integer, show its decimal and binary forms.

USING: formatting kernel lists lists.lazy math math.parser
sequences ;

1 lfrom [ >bin dup append bin> ] lmap-lazy [ 1000 < ] lwhile
[ dup "%d %b\n" printf ] leach
