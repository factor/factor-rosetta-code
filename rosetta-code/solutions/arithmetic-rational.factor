! Task:
! 
! Create a reasonably complete implementation of rational arithmetic in
! the particular language using the idioms of the language.
! 
! Example:
! 
! Define a new type called frac with binary operator "//" of two integers
! that returns a structure made up of the numerator and the denominator
! (as per a rational number).
! 
! Further define the appropriate rational unary operators abs and '-',
! with the binary operators for addition '+', subtraction '-',
! multiplication '×', division '/', integer division '÷', modulo division,
! the comparison operators (e.g. '<', '≤', '>', & '≥') and equality
! operators (e.g. '=' & '≠').
! 
! Define standard coercion operators for casting int to frac etc.
! 
! If space allows, define standard increment and decrement operators (e.g.
! '+:=' & '-:=' etc.).
! 
! Finally test the operators: Use the new type frac to find all perfect
! numbers less than 2¹⁹ by summing the reciprocal of the factors.
! 
! Related tasks:
! 
! -   Perfect Numbers
! -   Check Machin-like formulas
! 
! Category:Arithmetic

USING: generalizations io kernel math math.functions
math.primes.factors math.ranges prettyprint sequences ;
IN: rosetta-code.arithmetic-rational

2/5              ! literal syntax 2/5
2/4              ! automatically simplifies to 1/2
5/1              ! automatically coerced to 5
26/5             ! mixed fraction 5+1/5
13/178 >fraction ! get the numerator and denominator 13 178
8 recip          ! get the reciprocal 1/8

! ratios can be any size
12417829731289312/61237812937138912735712
8 ndrop ! clear the stack
! arithmetic works the same as any other number.

: perfect? ( n -- ? )
    divisors rest [ recip ] map-sum 1 = ;

"Perfect numbers <= 2^19: " print
2 19 ^ [1,b] [ perfect? ] filter .
