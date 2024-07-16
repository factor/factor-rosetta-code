! (Many programming languages, especially those with extended─precision
! integer arithmetic, usually support one of **, ^, ↑ or some such for
! exponentiation.)
! 
! Some languages treat/honor infix operators when performing
! exponentiation (raising numbers to some power by the language's
! exponentiation operator, if the computer programming language has one).
! 
! Other programming languages may make use of the POW or some other BIF
! (Built─In Ffunction), or some other library service.
! 
! If your language's exponentiation operator is not one of the usual ones,
! please comment on how to recognize it.
! 
! This task will deal with the case where there is some form of an infix
! operator operating in (or operating on) the base.
! 
! Example:
! 
! A negative five raised to the 3^(rd) power could be specified as:
! 
!    -5  ** 3          or as
!   -(5) ** 3          or as
!   (-5) ** 3          or as something else
! 
! (Not all computer programming languages have an exponential operator
! and/or support these syntax expression(s).
! 
! Task:
! 
! -   -   compute and display exponentiation with a possible infix
!         operator, whether specified and/or implied/inferred.
!     -   Raise the following numbers (integer or real):
!         -   -   -5 and
!             -   +5
!     -   to the following powers:
!         -   -   2^(nd) and
!             -   3^(rd)
!     -   using the following expressions (if applicable in your
!         language):
!         -   -   -x**p
!             -   -(x)**p
!             -   (-x)**p
!             -   -(x**p)
!     -   Show here (on this page) the four (or more) types of symbolic
!         expressions for each number and power.
! 
! Try to present the results in the same format/manner as the other
! programming entries to make any differences apparent.
! 
! The variables may be of any type(s) that is/are applicable in your
! language.
! 
! Related tasks:
! 
! -   Exponentiation order
! -   Exponentiation operator
! -   Arbitrary-precision integers (included)
! -   Parsing/RPN to infix conversion
! -   Operator precedence
! 
! References:
! 
! -   Wikipedia: Order of operations in Programming languages

USING: infix locals prettyprint sequences
sequences.generalizations sequences.repeating ;

:: row ( x p -- seq )
    x p "-x**p" [infix -x**p infix]
    "-(x)**p" [infix -(x)**p infix]
    "(-x)**p" [infix (-x)**p infix]
    "-(x**p)" [infix -(x**p) infix] 10 narray ;

{ "x value" "p value" } { "expression" "result" } 8 cycle append
-5 2 row
-5 3 row
5 2 row
5 3 row
5 narray simple-table.
