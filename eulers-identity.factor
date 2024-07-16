! In mathematics, Euler's identity is the equality:
! 
!                e^(iπ) + 1 = 0
! 
! where
! 
!    e is Euler's number, the base of natural logarithms,
!    i is the imaginary unit, which satisfies i² = −1, and
!    π is pi, the ratio of the circumference of a circle to its diameter.
! 
! Euler's identity is often cited as an example of deep mathematical
! beauty. Three of the basic arithmetic operations occur exactly once
! each: addition, multiplication, and exponentiation. The identity also
! links five fundamental mathematical constants:
! 
!    The number 0.
!    The number 1.
!    The number π (π = 3.14159+),
!    The number e (e = 2.71828+), which occurs widely in mathematical analysis.
!    The number i, the imaginary unit of the complex numbers.
! 
! Task
! 
! Show in your language that Euler's identity is true. As much as possible
! and practical, mimic the Euler's identity equation.
! 
! Most languages are limited to IEEE 754 floating point calculations so
! will have some error in the calculation.
! 
! If that is the case, or there is some other limitation, show that
! e^(iπ) + 1 is approximately equal to zero and show the amount of error
! in the calculation.
! 
! If your language is capable of symbolic calculations, show that e^(iπ) +
! 1 is exactly equal to zero for bonus kudos points.

USING: math math.constants math.functions prettyprint ;
1 e pi C{ 0 1 } * ^ + .
