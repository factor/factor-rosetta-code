! Just as numbers can be represented in a positional notation as sums of
! multiples of the powers of ten (decimal) or two (binary); all the
! positive integers can be represented as the sum of one or zero times the
! distinct members of the Fibonacci series.
! 
! Recall that the first six distinct Fibonacci numbers are: 1, 2, 3, 5, 8,
! 13.
! 
! The decimal number eleven can be written as 0*13 + 1*8 + 0*5 + 1*3 +
! 0*2 + 0*1 or 010100 in positional notation where the columns represent
! multiplication by a particular member of the sequence. Leading zeroes
! are dropped so that 11 decimal becomes 10100.
! 
! 10100 is not the only way to make 11 from the Fibonacci numbers however;
! 0*13 + 1*8 + 0*5 + 0*3 + 1*2 + 1*1 or 010011 would also represent
! decimal 11. For a true Zeckendorf number there is the added restriction
! that no two consecutive Fibonacci numbers can be used which leads to the
! former unique solution.
! 
! Task:
! 
! Generate and show here a table of the Zeckendorf number representations
! of the decimal numbers zero to twenty, in order.
! 
! The intention in this task to find the Zeckendorf form of an arbitrary
! integer. The Zeckendorf form can be iterated by some bit twiddling
! rather than calculating each value separately but leave that to another
! separate task.
! 
! Also see:
! 
! -   OEIS A014417 for the the sequence of required results.
! -   Brown's Criterion - Numberphile
! 
! Related task:
! 
! -   Fibonacci sequence

USING: formatting kernel locals make math sequences ;

:: fib<= ( n -- seq )
    1 2 [ [ dup n <= ] [ 2dup + [ , ] 2dip ] while drop , ]
    { } make ;
    
:: zeck ( n -- str )
    0 :> s! n fib<= <reversed>
    [ dup s + n <= [ s + s! 49 ] [ drop 48 ] if ] "" map-as ;
    
21 <iota> [ dup zeck "%2d: %6s\n" printf ] each
