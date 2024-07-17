! Use the Generalised floating point addition template to implement
! generalised floating point multiplication for a Balanced ternary test
! case.
! 
! Test case details: Balanced ternary is a way of representing numbers.
! Unlike the prevailing binary representation, a balanced ternary "real"
! is in base 3, and each digit can have the values 1, 0, or −1. For
! example, decimal 11 = 3² + 3¹ − 3⁰, thus can be written as "++−", while
! 6 = 3² − 3¹ + 0 × 3⁰, i.e., "+−0" and for an actual real number 6⅓ the
! exact representation is 3² − 3¹ + 0 × 3⁰ + 1 × 3⁻¹ i.e., "+−0.+"
! 
! For this task, implement balanced ternary representation of real numbers
! with the following:
! 
! Requirements
! 
! 1.  Support arbitrary precision real numbers, both positive and
!     negative;
! 2.  Provide ways to convert to and from text strings, using digits '+',
!     '-' and '0' (unless you are already using strings to represent
!     balanced ternary; but see requirement 5).
! 3.  Provide ways to convert to and from native integer and real type
!     (unless, improbably, your platform's native integer type is balanced
!     ternary). If your native integers can't support arbitrary length,
!     overflows during conversion must be indicated.
! 4.  Provide ways to perform addition, negation and multiplication
!     directly on balanced ternary integers; do not convert to native
!     integers first.
! 5.  Make your implementation efficient, with a reasonable definition of
!     "efficient" (and with a reasonable definition of "reasonable").
! 6.  The Template should successfully handle these multiplications in
!     other bases. In particular Septemvigesimal and "Balanced base-27".
! 
! Optionally:
! 
! -   For faster long multiplication use Karatsuba algorithm.
! -   Using the Karatsuba algorithm, spread the computation across
!     multiple CPUs.
! 
! Test case 1 - With balanced ternaries a from string "+-0++0+.+-0++0+", b
! from native real -436.436, c "+-++-.+-++-":
! 
! -   write out a, b and c in decimal notation.
! -   calculate a × (b − c), write out the result in both ternary and
!     decimal notations.
! -   In the above limit the precision to 81 ternary digits after the
!     point.
! 
! Test case 2 - Generate a multiplication table of balanced ternaries
! where the rows of the table are for a 1st factor of 1 to 27, and the
! column of the table are for the second factor of 1 to 12.
! 
! Implement the code in a generalised form (such as a Template, Module or
! Mixin etc) that permits reusing of the code for different Bases.
! 
! If it is not possible to implement code in syntax of the specific
! language then:
! 
! -   note the reason.
! -   perform the test case using a built-in or external library.


