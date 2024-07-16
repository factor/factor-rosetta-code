! Write a program to find the roots of a quadratic equation, i.e., solve
! the equation ax² + bx + c = 0. Your program must correctly handle
! non-real roots, but it need not check that a ≠ 0.
! 
! The problem of solving a quadratic equation is a good example of how
! dangerous it can be to ignore the peculiarities of floating-point
! arithmetic. The obvious way to implement the quadratic formula suffers
! catastrophic loss of accuracy when one of the roots to be found is much
! closer to 0 than the other. In their classic textbook on numeric methods
! Computer Methods for Mathematical Computations, George Forsythe, Michael
! Malcolm, and Cleve Moler suggest trying the naive algorithm with a = 1,
! b = −10⁵, and c = 1. (For double-precision floats, set b = −10⁹.)
! Consider the following implementation in Ada:
! 
!     with Ada.Text_IO;                        use Ada.Text_IO;
!     with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;
! 
!     procedure Quadratic_Equation is
!        type Roots is array (1..2) of Float;
!        function Solve (A, B, C : Float) return Roots is
!           SD : constant Float := sqrt (B**2 - 4.0 * A * C);
!           AA : constant Float := 2.0 * A;
!        begin
!           return ((- B + SD) / AA, (- B - SD) / AA);
!        end Solve;
! 
!        R : constant Roots := Solve (1.0, -10.0E5, 1.0);
!     begin
!        Put_Line ("X1 =" & Float'Image (R (1)) & " X2 =" & Float'Image (R (2)));
!     end Quadratic_Equation;
! 
!     X1 = 1.00000E+06 X2 = 0.00000E+00
! 
! As we can see, the second root has lost all significant figures. The
! right answer is that X2 is about 10⁻⁶. The naive method is numerically
! unstable.
! 
! Suggested by Middlebrook (D-OA), a better numerical method: to define
! two parameters $q = \sqrt{a c} / b$ and $f = 1/2 + \sqrt{1 - 4 q^2} /2$
! 
! and the two roots of the quardratic are: $\frac{-b}{a} f$ and
! $\frac{-c}{b f}$
! 
! Task: do it better. This means that given a = 1, b = −10⁹, and c = 1,
! both of the roots your program returns should be greater than 10⁻¹¹. Or,
! if your language can't do floating-point arithmetic any more precisely
! than single precision, your program should be able to handle b = −10⁶.
! Either way, show what your program gives as the roots of the quadratic
! in question. See page 9 of "What Every Scientist Should Know About
! Floating-Point Arithmetic" for a possible algorithm.

( scratchpad ) 1 -1.e20 1 quadratic-equation
--- Data stack:
1.0e+20
1.0e-20
