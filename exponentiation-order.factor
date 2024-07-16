! This task will demonstrate the order of exponentiation (x^(y)) when
! there are multiple exponents.
! 
! (Many programming languages, especially those with extended─precision
! integer arithmetic, usually support one of **, ^, ↑ or some such for
! exponentiation.)
! 
! Task requirements
! 
! Show the result of a language's evaluation of multiple exponentiation
! (either as an integer or floating point).
! 
! If your language's exponentiation operator is not one of the usual ones,
! please comment on how to recognize it.
! 
! Using whatever operator or syntax your language supports (if any), show
! the results in three lines (with identification):
! 
! -   -   5**3**2
!     -   (5**3)**2
!     -   5**(3**2)
! 
! If there are other methods (or formats) of multiple exponentiations,
! show them as well.
! 
! See also:
! 
! -   MathWorld entry: exponentiation
! 
! Related tasks:
! 
! -   exponentiation operator
! -   arbitrary-precision integers (included)
! -   Exponentiation with infix operators in (or operating on) the base

USING: formatting infix ;

[infix  5**3**2    infix]
"5**3**2   = %d\n" printf

[infix  (5**3)**2  infix]
"(5**3)**2 = %d\n" printf

[infix  5**(3**2)  infix]
"5**(3**2) = %d\n" printf
