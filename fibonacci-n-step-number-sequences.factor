! These number series are an expansion of the ordinary Fibonacci sequence
! where:
! 
! 1.  For n = 2 we have the Fibonacci sequence; with initial values [1, 1]
!     and F_(k)² = F_(k − 1)² + F_(k − 2)²
! 2.  For n = 3 we have the tribonacci sequence; with initial values
!     [1, 1, 2] and F_(k)³ = F_(k − 1)³ + F_(k − 2)³ + F_(k − 3)³
! 3.  For n = 4 we have the tetranacci sequence; with initial values
!     [1, 1, 2, 4] and
!     F_(k)⁴ = F_(k − 1)⁴ + F_(k − 2)⁴ + F_(k − 3)⁴ + F_(k − 4)⁴
! 
! ...
! 
! 1.  For general n > 2 we have the Fibonacci n-step sequence - F_(k)^(n);
!     with initial values of the first n values of the (n − 1)'th
!     Fibonacci n-step sequence F_(k)^(n − 1); and k'th value of this n'th
!     sequence being $F_k^n = \sum_{i=1}^{(n)} {F_{k-i}^{(n)}}$
! 
! For small values of n, Greek numeric prefixes are sometimes used to
! individually name each series.
! 
!         {| style="text-align: left;" border="4" cellpadding="2"
!         cellspacing="2"
! 
! |+ Fibonacci n-step sequences |- style="background-color: rgb(255, 204,
! 255);" ! n !! Series name !! Values |- | 2 || fibonacci || 1 1 2 3 5 8
! 13 21 34 55 89 144 233 377 610 ... |- | 3 || tribonacci || 1 1 2 4 7 13
! 24 44 81 149 274 504 927 1705 3136 ... |- | 4 || tetranacci || 1 1 2 4 8
! 15 29 56 108 208 401 773 1490 2872 5536 ... |- | 5 || pentanacci || 1 1
! 2 4 8 16 31 61 120 236 464 912 1793 3525 6930 ... |- | 6 || hexanacci ||
! 1 1 2 4 8 16 32 63 125 248 492 976 1936 3840 7617 ... |- | 7 ||
! heptanacci || 1 1 2 4 8 16 32 64 127 253 504 1004 2000 3984 7936 ... |-
! | 8 || octonacci || 1 1 2 4 8 16 32 64 128 255 509 1016 2028 4048 8080
! ... |- | 9 || nonanacci || 1 1 2 4 8 16 32 64 128 256 511 1021 2040 4076
! 8144 ... |- | 10 || decanacci || 1 1 2 4 8 16 32 64 128 256 512 1023
! 2045 4088 8172 ... |}
! 
! Allied sequences can be generated where the initial values are changed:
! 
!     The Lucas series sums the two preceding values like the fibonacci
!     series for n = 2 but uses [2, 1] as its initial values.
! 
! Task:
! 
! 1.  Write a function to generate Fibonacci n-step number sequences given
!     its initial values and assuming the number of initial values
!     determines how many previous values are summed to make the next
!     number of the series.
! 2.  Use this to print and show here at least the first ten members of
!     the Fibo/tribo/tetra-nacci and Lucas sequences.
! 
! Related tasks:
! 
! -   Fibonacci sequence
! -   Wolfram Mathworld
! -   Hofstadter Q sequence‎
! -   Leonardo numbers
! 
! Also see:
! 
! -   Lucas Numbers - Numberphile (Video)
! -   Tribonacci Numbers (and the Rauzy Fractal) - Numberphile (Video)
! -   Wikipedia, Lucas number
! -   MathWorld, Fibonacci Number
! -   Some identities for r-Fibonacci numbers
! -   OEIS Fibonacci numbers
! -   OEIS Lucas numbers

USING: formatting fry kernel make math namespaces qw sequences ;

: n-bonacci ( n initial -- seq ) [
        [ [ , ] each ] [ length - ] [ length ] tri
        '[ building get _ tail* sum , ] times
    ] { } make ;
    
qw{ fibonacci tribonacci tetranacci lucas }
{ { 1 1 } { 1 1 2 } { 1 1 2 4 } { 2 1 } }
[ 10 swap n-bonacci "%-10s %[%3d, %]\n" printf ] 2each
